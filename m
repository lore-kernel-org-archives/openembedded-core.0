Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 77D7E6DD0E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 12:02:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rARC2CsK026657; Wed, 27 Nov 2013 12:02:13 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vDs1ZcCR_ht6; Wed, 27 Nov 2013 12:02:12 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rARC28wX026651
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 27 Nov 2013 12:02:09 GMT
Message-ID: <1385553725.11246.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yue Tao <Yue.Tao@windriver.com>
Date: Wed, 27 Nov 2013 12:02:05 +0000
In-Reply-To: <1385538944-8585-1-git-send-email-Yue.Tao@windriver.com>
References: <1385538944-8585-1-git-send-email-Yue.Tao@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] file: avoid to handle special character
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Nov 2013 12:02:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-27 at 15:55 +0800, Yue Tao wrote:
> From: Li Wang <li.wang@windriver.com>
> 
> avoid to handle special character '@' in filename and directory.
> 
> Signed-off-by: Li Wang <li.wang@windriver.com>
> ---
>  .../file/file/avoid_handle_special_character.patch |   36 ++++++++++++++++++++
>  meta/recipes-devtools/file/file_5.15.bb            |    1 +
>  2 files changed, 37 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/file/file/avoid_handle_special_character.patch

No patch header and do we support "@" in directory names for builds?
Doesn't this break '#' instead?

Cheers,

Richard

> diff --git a/meta/recipes-devtools/file/file/avoid_handle_special_character.patch b/meta/recipes-devtools/file/file/avoid_handle_special_character.patch
> new file mode 100644
> index 0000000..4be4ad0
> --- /dev/null
> +++ b/meta/recipes-devtools/file/file/avoid_handle_special_character.patch
> @@ -0,0 +1,36 @@
> +--- a/doc/Makefile.am
> ++++ b/doc/Makefile.am
> +@@ -12,21 +12,21 @@
> + 
> + file.1:	Makefile file.man
> + 	@rm -f $@
> +-	sed -e s@__CSECTION__@1@g \
> +-	    -e s@__FSECTION__@${fsect}@g \
> +-	    -e s@__VERSION__@${VERSION}@g \
> +-	    -e s@__MAGIC__@${MAGIC}@g $(srcdir)/file.man > $@
> ++	sed -e s#__CSECTION__#1#g \
> ++	    -e s#__FSECTION__#${fsect}#g \
> ++	    -e s#__VERSION__#${VERSION}#g \
> ++	    -e s#__MAGIC__#${MAGIC}#g $(srcdir)/file.man > $@
> + 
> + magic.${fsect}: Makefile magic.man
> + 	@rm -f $@
> +-	sed -e s@__CSECTION__@1@g \
> +-	    -e s@__FSECTION__@${fsect}@g \
> +-	    -e s@__VERSION__@${VERSION}@g \
> +-	    -e s@__MAGIC__@${MAGIC}@g $(srcdir)/magic.man > $@
> ++	sed -e s#__CSECTION__#1#g \
> ++	    -e s#__FSECTION__#${fsect}#g \
> ++	    -e s#__VERSION__#${VERSION}#g \
> ++	    -e s#__MAGIC__#${MAGIC}#g $(srcdir)/magic.man > $@
> + 
> + libmagic.3: Makefile libmagic.man
> + 	@rm -f $@
> +-	sed -e s@__CSECTION__@1@g \
> +-	    -e s@__FSECTION__@${fsect}@g \
> +-	    -e s@__VERSION__@${VERSION}@g \
> +-	    -e s@__MAGIC__@${MAGIC}@g $(srcdir)/libmagic.man > $@
> ++	sed -e s#__CSECTION__#1#g \
> ++	    -e s#__FSECTION__#${fsect}#g \
> ++	    -e s#__VERSION__#${VERSION}#g \
> ++	    -e s#__MAGIC__#${MAGIC}#g $(srcdir)/libmagic.man > $@
> diff --git a/meta/recipes-devtools/file/file_5.15.bb b/meta/recipes-devtools/file/file_5.15.bb
> index aecbbe5..0697838 100644
> --- a/meta/recipes-devtools/file/file_5.15.bb
> +++ b/meta/recipes-devtools/file/file_5.15.bb
> @@ -12,6 +12,7 @@ DEPENDS = "zlib file-native"
>  DEPENDS_class-native = "zlib-native"
>  
>  SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
> +           file://avoid_handle_special_character.patch \
>             file://dump \
>             file://filesystems"
>  



