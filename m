Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RqqbK-0005bL-Dm
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 19:32:42 +0100
Received: by obbuo9 with SMTP id uo9so2206705obb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 10:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ReSg0TMxbr7HNFgUvEkYATZukhykYThEkyVZLxe5TVc=;
	b=u5XtVAtOHyiQgQpXh5RvKeS7JWA+90MjP7PZTmHz1eZgObonZ9IQHxa+ka8cReNQl4
	mz55skbMwXjW3q12wrOhE2lap1hznqISMdWOf4pMAwhExVq7prAT5uIoXejVpDLRtx/9
	TZs4azgpNAyWBj/0YQXBUxH0d1UNpdPHw04y8=
MIME-Version: 1.0
Received: by 10.182.38.7 with SMTP id c7mr7408576obk.44.1327688692847; Fri, 27
	Jan 2012 10:24:52 -0800 (PST)
Received: by 10.60.3.228 with HTTP; Fri, 27 Jan 2012 10:24:52 -0800 (PST)
In-Reply-To: <CAGDS+nkex8qcbSWmCRbC846FZb=PVd3fTMoxttPEWhxg6AuMhg@mail.gmail.com>
References: <CAGDS+nkex8qcbSWmCRbC846FZb=PVd3fTMoxttPEWhxg6AuMhg@mail.gmail.com>
Date: Fri, 27 Jan 2012 10:24:52 -0800
Message-ID: <CAGDS+nnLgqWQ6J+UKQ3WmZmVCjO4tGShuzqJ+uUSY=JKEcgv3A@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Avahi broken?
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
X-List-Received-Date: Fri, 27 Jan 2012 18:32:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 27, 2012 at 10:17 AM, Steve Sakoman <sakoman@gmail.com> wrote:
> After a pull this morning I am getting:
>
> ERROR: Nothing PROVIDES '"base-passwd'
> ERROR: Required build target 'avahi' has no buildable providers.
> Missing or unbuildable dependency chain was: ['avahi', '"base-passwd']
>
> Note the extraneous double quote prepended to base-passwd
>
> Anyone else see this?
>
> I suspect it was introduced with the "useradd: Ensure dependencies are
> only added for target recipes, not native or nativesdk" patch which
> seems to have a missing close quote on the USERADDSETSCENEDEPS line.

I can confirm that adding a close quote to the above mentioned line
fixes the issue.

I'm sure gmail will munge this due to the long line, but here goes anyway:

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index f935028..8eb6444 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -111,7 +111,7 @@ SYSROOTPOSTFUNC = "useradd_sysroot_sstate"
 SYSROOTPOSTFUNC_virtclass-native = ""
 SYSROOTPOSTFUNC_virtclass-nativesdk = ""

-USERADDSETSCENEDEPS = "base-passwd:do_populate_sysroot_setscene
shadow-native:do_populate_sysroot_setscene
shadow-sysroot:do_populate_sysroot_setscene
+USERADDSETSCENEDEPS = "base-passwd:do_populate_sysroot_setscene
shadow-native:do_populate_sysroot_setscene
shadow-sysroot:do_populate_sysroot_setscene"
 USERADDSETSCENEDEPS_virtclass-native = ""
 USERADDSETSCENEDEPS_virtclass-nativesdk = ""
 do_package_setscene[depends] = "${USERADDSETSCENEDEPS}"

Or via gitweb:

http://www.sakoman.com/cgi-bin/gitweb.cgi?p=poky.git;a=commitdiff;h=7b5786c226243b49e12113b414a76298e51c7c2c

Steve


