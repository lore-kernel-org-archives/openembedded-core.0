Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHEY5-0007TE-5k for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 14:17:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p43CFAqZ019402;
	Tue, 3 May 2011 13:15:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13170-10; Tue,  3 May 2011 13:15:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p43CEx4Y019366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 3 May 2011 13:15:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTimx4ry=vZdiNzYna1EE121Q85mUOA@mail.gmail.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<ed1614da74a5bf5820855d9d5bd9ab6213bc36de.1303889119.git.sgw@linux.intel.com>
	<1303981290.21461.39.camel@rex>
	<BANLkTimx4ry=vZdiNzYna1EE121Q85mUOA@mail.gmail.com>
Date: Tue, 03 May 2011 13:14:58 +0100
Message-ID: <1304424898.21461.107.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 36/52] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Tue, 03 May 2011 12:17:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-29 at 09:11 -0700, Khem Raj wrote:
> On Thu, Apr 28, 2011 at 2:01 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > We can make this simpler. We should just setVar("DEPENDS_GETTEXT", "")
> > in the INHIBIT_DEFAULT_DEPS case. If anything is expanding the variables
> > somewhere, we should fix that.
> >
> 
> Infact the virtclass stuff complicates this since they are evaluated
> specially and I am not clear weather _append gets
> evaluation before that or after and also the anon python function
> evaluation as the one we are defining in this class.
> 
> I tried to empty out DEPENDS_GETTEXT but it does not work in nativesdk cases.

I still think we can simplify this. Could you try the following patch
please?:

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4f20bc2..3b83e42 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -89,9 +89,11 @@ def base_dep_prepend(d):
 			deps += " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc "
 	return deps
 
-DEPENDS_prepend="${@base_dep_prepend(d)} "
-DEPENDS_virtclass-native_prepend="${@base_dep_prepend(d)} "
-DEPENDS_virtclass-nativesdk_prepend="${@base_dep_prepend(d)} "
+BASEDEPENDS = "${@base_dep_prepend(d)}"
+
+DEPENDS_prepend="${BASEDEPENDS} "
+DEPENDS_virtclass-native_prepend="${BASEDEPENDS} "
+DEPENDS_virtclass-nativesdk_prepend="${BASEDEPENDS} "
 
 FILESPATH = "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", "${FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files", "${FILE_DIRNAME}" ], d)}"
 # THISDIR only works properly with imediate expansion as it has to run
diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index a40e74f..57b551e 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -1,17 +1,17 @@
 def gettext_after_parse(d):
     # Remove the NLS bits if USE_NLS is no.
-    if bb.data.getVar('USE_NLS', d, 1) == 'no':
-        cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
-        cfg += " --disable-nls"
-        depends = bb.data.getVar('DEPENDS', d, 1) or ""
-        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
-        bb.data.setVar('EXTRA_OECONF', cfg, d)
+    if bb.data.getVar('USE_NLS', d, True) == 'no':
+        bb.data.setVar('DEPENDS_GETTEXT', "", d)
+        bb.data.setVar('OECONFNLSOPTION', '--disable-nls', d)
+    if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not oe.utils.inherits(d, 'cross-canadian'):
+        bb.data.setVar('DEPENDS_GETTEXT', "", d)
 
 python () {
     gettext_after_parse(d)
 }
 
-DEPENDS_GETTEXT = "gettext gettext-native"
+DEPENDS_GETTEXT = "virtual/gettext gettext-native"
+OECONFNLSOPTION = "--enable-nls"
 
-DEPENDS =+ "${DEPENDS_GETTEXT}"
-EXTRA_OECONF += "--enable-nls"
+BASEDEPENDS =+ "${DEPENDS_GETTEXT}"
+EXTRA_OECONF += "${OECONFNLSOPTION}"





