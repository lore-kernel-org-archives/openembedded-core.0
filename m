Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QTfXY-0006fh-NX for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 21:32:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p56JTSFZ008655
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 20:29:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08257-07 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2011 20:29:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p56JTMdJ008649
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 20:29:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTin=ZK9g5LM60TgvtpQqiqE3TYpUJw@mail.gmail.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
	<e66fee724ac6efa49cb941a59b2fc7c61bf14405.1307342214.git.sgw@linux.intel.com>
	<1307380473.7672.30.camel@rex>
	<BANLkTin=ZK9g5LM60TgvtpQqiqE3TYpUJw@mail.gmail.com>
Date: Mon, 06 Jun 2011 20:29:20 +0100
Message-ID: <1307388560.7672.44.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 10/20] package.bbclass: add support to split Qt translation files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jun 2011 19:32:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-06 at 17:27 +0000, Otavio Salvador wrote:
> On Mon, Jun 6, 2011 at 17:14, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sun, 2011-06-05 at 23:44 -0700, Saul Wold wrote:
> >> From: Otavio Salvador <otavio@ossystems.com.br>
> >>
> >> There're many Qt applications that provide translation files in '.qm'
> >> format however those weren't being splitted as GetText based
> >> ones.
> >>
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >
> > Am I right in assuming all these qt applications use one of the qt
> > classes?
> 
> I'd expect it.
> 
> > I do wonder if this shouldn't be part of one of the qt classes as part
> > of a package_do_split_locales_append() or prepend() style function from
> > a code separation point of view.
> 
> I believe there's going to have a lot of code duplication between the
> two to do that.

Not really. Something like:

python package_do_split_locales_qm() {
   import re

   dvar = bb.data.getVar('PKGD', d, True)
 
   # Check of Qt translation files
   qm_re = re.compile("(.*)\.qm$")
   qm_files = {}
   for root, dirs, files in os.walk(dvar):
       for file in files:
           qm_file = qm_re.match(file)
           if qm_file:
               locale = qm_file.group(1)
               relpath = os.path.join(root, file).replace(dvar, '', 1)
               if relpath:
                   if not qm_files.has_key(locale):
                       qm_files[locale] = []
                   qm_files[locale].append(relpath)
 
    locale_re = re.compile("^.*([a-z]{2}(_[A-Z]{2})?)$")
    for l in qm_files:
        ln = legitimize_package_name(locale_re.match(l).group(1))
        pkg = pn + '-locale-' + ln
        bb.data.setVar('FILES_' + pkg, " ".join(qm_files[l]), d)
}

PACKAGE_PREPROCESS_FUNCS += "package_do_split_locales_qm"

which doesn't really duplicate anything with package.bbclass. To make
that work we'd need to set PACKAGELOCALES and change package.bbclass to
something like:

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1e6a872..66796e7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -358,12 +358,18 @@ python package_do_split_locales() {
 
 	localedir = os.path.join(dvar + datadir, 'locale')
 
-	if not os.path.isdir(localedir):
+	locales = set()
+	if os.path.isdir(localedir):
+		locales |= os.listdir(localedir)
+
+	extralocales = d.getVar("PACKAGELOCALES", True)
+	if extralocales:
+		locales |= extralocales
+
+	if not locales:
 		bb.debug(1, "No locale files in this package")
 		return
 
-	locales = os.listdir(localedir)
-
 	# This is *really* broken
 	mainpkg = packages[0]
 	# At least try and patch it up I guess...
@@ -378,7 +384,11 @@ python package_do_split_locales() {
 		ln = legitimize_package_name(l)
 		pkg = pn + '-locale-' + ln
 		packages.append(pkg)
-		bb.data.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l), d)
+		files = os.path.join(datadir, 'locale', l)
+		extrafiles = d.getVar('FILES_' + pkg, True)
+		if extrafiles:
+			files = extrafiles + " " + files
+		bb.data.setVar('FILES_' + pkg, files, d)
 		bb.data.setVar('RDEPENDS_' + pkg, '%s virtual-locale-%s' % (mainpkg, ln), d)
 		bb.data.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln), d)
 		bb.data.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l), d)

and there are probably neater ways to do this.

> > I do appreciate the need to influence
> > the list of locales although you could do that through directory
> > creation or an extra variable but we could enhance package.bbclass to
> > support that.
> 
> I don't understand what you meant by this. Mind to elaborate it a bit more?

See above for the kind of thing I'm thinking of.

> ...
> >> +             if qm_files.has_key(l):
> >> +                     locale_re = re.compile("^.*([a-z]{2}(_[A-Z]{2})?)$")
> >> +                     ln = legitimize_package_name(locale_re.match(l).group(1))
> >> +                     files += qm_files[l]
> >
> > Regardless, this is changing ln under some weird circumstances.
> > Shouldn't the code adding this to the locales list be handling this
> > translation? I can see potential duplication between the arrays and a
> > host of other nasty bugs with this code as it stands :/. Please take
> > that regexp out of this loop at the very least.
> 
> Where do you suggest me to move the regexp to?

Well, I was thinking about the loop above this one just over qm_files
instead of all locales. Also note that re.compile can be reused and can
also live outside any looping.

Cheers,

Richard





