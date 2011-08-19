Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QuPvb-0003fc-0V for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 16:20:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JEFNBP028265
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:15:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26909-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:15:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JEFChf028258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:15:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1313636261-5074-1-git-send-email-aalonso00@gmail.com>
References: <1313636261-5074-1-git-send-email-aalonso00@gmail.com>
Date: Fri, 19 Aug 2011 09:15:10 -0500
Message-ID: <1313763310.13995.95.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH][v2] file: new file version 5.07
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
X-List-Received-Date: Fri, 19 Aug 2011 14:20:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-17 at 21:57 -0500, Adrian Alonso wrote:
> * file version 5.07 also prevents magic file mistmatch
>   in Fedora 15
> * related to bug 1358.
>   http://bugzilla.pokylinux.org/show_bug.cgi?id=1358
> * v2 remove previous file version 5.04
>   remove unused patchs

When you say these are unused patches, were the fixes merged into
upstream or did these patches simply fail to apply so you dropped them?

Cheers,

Richard

> 
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
>  meta/recipes-devtools/file/file/ge-le.patch        |   72 --------------------
>  .../file/file/stringb-compat.patch                 |   31 ---------
>  meta/recipes-devtools/file/file_5.04.bb            |   39 -----------
>  meta/recipes-devtools/file/file_5.07.bb            |   36 ++++++++++
>  4 files changed, 36 insertions(+), 142 deletions(-)
>  delete mode 100644 meta/recipes-devtools/file/file/ge-le.patch
>  delete mode 100644 meta/recipes-devtools/file/file/stringb-compat.patch
>  delete mode 100644 meta/recipes-devtools/file/file_5.04.bb
>  create mode 100644 meta/recipes-devtools/file/file_5.07.bb
> 
> diff --git a/meta/recipes-devtools/file/file/ge-le.patch b/meta/recipes-devtools/file/file/ge-le.patch
> deleted file mode 100644
> index fb7d671..0000000
> --- a/meta/recipes-devtools/file/file/ge-le.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -Upstream-Status: Pending
> -
> -`>=' and `<=' was silently ignored in previous version,
> -but causes an warning in file 5.04. Add support for these
> -two operators as a feature extension, however, users should
> -not rely on them.
> -
> -8/17/2010 - created by Qing He <qing.he@intel.com>
> -
> -diff --git a/src/apprentice.c b/src/apprentice.c
> -index 3d4c3cf..a2b86ed 100644
> ---- a/src/apprentice.c
> -+++ b/src/apprentice.c
> -@@ -1396,11 +1396,10 @@ parse(struct magic_set *ms, struct magic_entry **mentryp, uint32_t *nmentryp,
> -   		m->reln = *l;
> -   		++l;
> - 		if (*l == '=') {
> --			if (ms->flags & MAGIC_CHECK) {
> --				file_magwarn(ms, "%c= not supported",
> --				    m->reln);
> --				return -1;
> --			}
> -+		    if (m->reln == '>')
> -+			m->reln = 'g';
> -+		    else if (m->reln == '<')
> -+			m->reln = 'l';
> - 		   ++l;
> - 		}
> - 		break;
> -diff --git a/src/softmagic.c b/src/softmagic.c
> -index d8a5675..1648e43 100644
> ---- a/src/softmagic.c
> -+++ b/src/softmagic.c
> -@@ -1955,6 +1955,38 @@ magiccheck(struct magic_set *ms, struct magic *m)
> - 		}
> - 		break;
> - 
> -+	case 'g':
> -+		if (m->flag & UNSIGNED) {
> -+			matched = v >= l;
> -+			if ((ms->flags & MAGIC_DEBUG) != 0)
> -+				(void) fprintf(stderr, "%llu >= %llu = %d\n",
> -+				    (unsigned long long)v,
> -+				    (unsigned long long)l, matched);
> -+		}
> -+		else {
> -+			matched = (int64_t) v >= (int64_t) l;
> -+			if ((ms->flags & MAGIC_DEBUG) != 0)
> -+				(void) fprintf(stderr, "%lld >= %lld = %d\n",
> -+				    (long long)v, (long long)l, matched);
> -+		}
> -+		break;
> -+
> -+	case 'l':
> -+		if (m->flag & UNSIGNED) {
> -+			matched = v <= l;
> -+			if ((ms->flags & MAGIC_DEBUG) != 0)
> -+				(void) fprintf(stderr, "%llu <= %llu = %d\n",
> -+				    (unsigned long long)v,
> -+				    (unsigned long long)l, matched);
> -+		}
> -+		else {
> -+			matched = (int64_t) v <= (int64_t) l;
> -+			if ((ms->flags & MAGIC_DEBUG) != 0)
> -+				(void) fprintf(stderr, "%lld <= %lld = %d\n",
> -+				       (long long)v, (long long)l, matched);
> -+		}
> -+		break;
> -+
> - 	case '&':
> - 		matched = (v & l) == l;
> - 		if ((ms->flags & MAGIC_DEBUG) != 0)
> diff --git a/meta/recipes-devtools/file/file/stringb-compat.patch b/meta/recipes-devtools/file/file/stringb-compat.patch
> deleted file mode 100644
> index 8aba31e..0000000
> --- a/meta/recipes-devtools/file/file/stringb-compat.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Upstream-Status: Pending
> -
> -`B' in file 4.x has the same meaning with `W' in file 5,
> -let `B' be an alias of `W'.
> -
> -8/17/2010 - created by Qing He <qing.he@intel.com>
> -
> -diff --git a/src/apprentice.c b/src/apprentice.c
> -index 58826c3..3d4c3cf 100644
> ---- a/src/apprentice.c
> -+++ b/src/apprentice.c
> -@@ -1340,6 +1340,7 @@ parse(struct magic_set *ms, struct magic_entry **mentryp, uint32_t *nmentryp,
> - 						    "zero range");
> - 					l = t - 1;
> - 					break;
> -+				case CHAR_COMPACT_BLANK:
> - 				case CHAR_COMPACT_WHITESPACE:
> - 					m->str_flags |= STRING_COMPACT_WHITESPACE;
> - 					break;
> -diff --git a/src/file.h b/src/file.h
> -index c07f2d4..42cf416 100644
> ---- a/src/file.h
> -+++ b/src/file.h
> -@@ -282,6 +282,7 @@ struct magic {
> - #define STRING_TEXTTEST				BIT(5)
> - #define STRING_BINTEST				BIT(6)
> - #define CHAR_COMPACT_WHITESPACE			'W'
> -+#define CHAR_COMPACT_BLANK			'B'
> - #define CHAR_COMPACT_OPTIONAL_WHITESPACE	'w'
> - #define CHAR_IGNORE_LOWERCASE			'c'
> - #define CHAR_IGNORE_UPPERCASE			'C'
> diff --git a/meta/recipes-devtools/file/file_5.04.bb b/meta/recipes-devtools/file/file_5.04.bb
> deleted file mode 100644
> index 1f9c78e..0000000
> --- a/meta/recipes-devtools/file/file_5.04.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -SUMMARY = "File classification tool"
> -DESCRIPTION = "File attempts to classify files depending \
> -on their contents and prints a description if a match is found."
> -HOMEPAGE = "http://www.darwinsys.com/file/"
> -SECTION = "console/utils"
> -
> -# two clause BSD
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
> -
> -DEPENDS = "zlib file-native"
> -DEPENDS_virtclass-native = "zlib-native"
> -PR = "r2"
> -
> -SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
> -           file://stringb-compat.patch \
> -           file://ge-le.patch \
> -           file://dump \
> -           file://filesystems"
> -
> -SRC_URI[md5sum] = "accade81ff1cc774904b47c72c8aeea0"
> -SRC_URI[sha256sum] = "4c9e6e7994e74cb3386374ae91b055d26ac96b9d3e82fd157ae2d62e87a4260c"
> -
> -inherit autotools
> -
> -do_configure_prepend() {
> -	cp ${WORKDIR}/dump ${S}/magic/Magdir/
> -	cp ${WORKDIR}/filesystems ${S}/magic/Magdir/
> -}
> -
> -FILES_${PN} += "${datadir}/misc/*.mgc"
> -
> -do_install_append_virtclass-native() {
> -	create_cmdline_wrapper ${D}/${bindir}/file \
> -		--magic-file ${datadir}/misc/magic.mgc
> -}
> -
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-devtools/file/file_5.07.bb b/meta/recipes-devtools/file/file_5.07.bb
> new file mode 100644
> index 0000000..9b5b51f
> --- /dev/null
> +++ b/meta/recipes-devtools/file/file_5.07.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "File classification tool"
> +DESCRIPTION = "File attempts to classify files depending \
> +on their contents and prints a description if a match is found."
> +HOMEPAGE = "http://www.darwinsys.com/file/"
> +SECTION = "console/utils"
> +
> +# two clause BSD
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
> +
> +DEPENDS = "zlib file-native"
> +DEPENDS_virtclass-native = "zlib-native"
> +PR = "r0"
> +
> +SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
> +           file://dump \
> +           file://filesystems"
> +
> +SRC_URI[md5sum] = "b8d1f9a8a644067bd0a703cebf3f4858"
> +SRC_URI[sha256sum] = "c968bfe97d87f9f564728a894d57be2c6bba9a2006763fffff85c5f72a9a3c2f"
> +
> +inherit autotools
> +
> +do_configure_prepend() {
> +	cp ${WORKDIR}/dump ${S}/magic/Magdir/
> +	cp ${WORKDIR}/filesystems ${S}/magic/Magdir/
> +}
> +
> +FILES_${PN} += "${datadir}/misc/*.mgc"
> +
> +do_install_append_virtclass-native() {
> +	create_cmdline_wrapper ${D}/${bindir}/file \
> +		--magic-file ${datadir}/misc/magic.mgc
> +}
> +
> +BBCLASSEXTEND = "native"




