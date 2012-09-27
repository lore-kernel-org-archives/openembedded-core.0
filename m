Received: from dmz4.rosetechnology.dk ([95.154.61.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sml@rosetechnology.dk>) id 1THFXu-00068o-Uc
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 16:58:35 +0200
Received: from smlws1.rosetechnology.dk (unknown [95.154.61.6])
	by dmz4.rosetechnology.dk (Postfix) with ESMTPA id DBAD4A3046
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 16:36:48 +0200 (CEST)
Message-ID: <50646480.40108@rosetechnology.dk>
Date: Thu, 27 Sep 2012 16:36:48 +0200
From: =?ISO-8859-1?Q?Steven_Munk_=D8stergaard?= <sml@rosetechnology.dk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Fail in perl-native_5.14.2.bb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 14:58:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello, peace be with thee... :)

I found a mistake in the "do_configure()" function of: 
"perl-native_5.14.2.bb"

I am not experienced enough with mailing list to produce patches, but i 
will try...

Explanation:
sed is in " -e "s%/perl5%/perl%g" \ " replacing parts of @DESTDIR@ which 
makes its patch way to long and doubles up parts of it's folders...
This patch works for me...


Index: perl/perl_5.14.2.bb
===================================================================
--- perl.orig/perl_5.14.2.bb
+++ perl/perl_5.14.2.bb
@@ -146,14 +146,14 @@ do_configure() {
      ${@base_contains('DISTRO_FEATURES', 'largefile', '', 
'do_nolargefile', d)}

          # Update some paths in the configuration
-        sed -i -e 's,@DESTDIR@,${prefix},g' \
-               -e 's,@ARCH@-thread-multi,,g' \
+        sed -i -e 's,@ARCH@-thread-multi,,g' \
                 -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
                 -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
                 -e "s%\([ \"^\',=]\+\)/usr/include%\1${STAGING_INCDIR}%g" \
             -e "s%\([ \"^\',=]\+\)/usr/lib/%\1${libdir}/%g" \
             -e "s%\([ \"^\',=]\+\)/usr/%\1${exec_prefix}/%g" \
             -e "s%/perl5%/perl%g" \
+           -e 's,@DESTDIR@,${prefix},g' \
              config.sh-${TARGET_ARCH}-${TARGET_OS}

      case "${TARGET_ARCH}" in


