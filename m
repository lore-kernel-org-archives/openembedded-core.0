Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id CFF107D1F3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 16:37:24 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id a190so4681975ite.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 09:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=jYmpPctdBb2DO1xeH/Ci6NHjDQTHEYH0FB7W+7Q2alI=;
	b=Qd9v/jtqc+0vOX5GYoa8tZvT+OXU5CvSCIKb212t3xak4rDkjr0fDcU9dtbd7wjSas
	BZsR0HW212JfLTF1ytAS6XyGLil4R4kfsRjDAJuUfVPdfBQuTn3KRNG9mTcri8PLyUy6
	Lm+Gxw4nF6zMz9uxNbjNMJRmCCfo5xTujxgpvhuzFF6BLEHThfWpTt4spM8TBw3UYG6d
	BZABGYvQVeidz6hHbptFDhWH4Sz7zzgoy6jm9AOMDtmC2RqKtWoQqnkDMXvehmdKrgQG
	5KwW8IJ65rKxpQAVGA5k0U91VlK4cysxobm0nPpQ6470C+wBEemuseruDCVueAzb/TcN
	V2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=jYmpPctdBb2DO1xeH/Ci6NHjDQTHEYH0FB7W+7Q2alI=;
	b=CvxPjxnfLw4f18v7AF9KRUyXvkTOsGLSum9ADfrRGHbKfEJ0DUmXCLcIfcCZEVQ4Yy
	5MJ9n5XJNSubhKOZ0wuRkfs8iJrAxgTayPjhaNt0PCCkSFM1RCGGpT0+G+gaQ2TbgRFN
	cVcBQlSmaj2LE/Le2da7XNtqmVoQz4V5h8hFfWdlLl9bxAVqbw5FOqr7yswXLypsNLgS
	UVthn3m1pChxhJqNSlujNjBRf3gh97PD2y2RxZzGoumVFvpveAsEZjlypeSMBR9SHIjV
	iwQcnkGHKTp4TWucOHEbyJmoWgUC21OnQHS36k81vJnEQg6GrN328sIqQnTnHZ46jGmQ
	2AHw==
X-Gm-Message-State: APjAAAXZyjd2J7L1oLqjXY9PCKcwf1n8IKLHqJN73BEkX08T0D0P/s6z
	vE226+gWoUrtL7gqyZ+MLJxrMpXg7HMAEI3NWPTVMOTE
X-Google-Smtp-Source: APXvYqx06s7VjN8ZAK8dXxMLmM81oQWxaXq+MBFclGVcqCHkXJu50SVYXLqOBadOaNzhTzRxB+DsLSDHwNZj9ZbIro4=
X-Received: by 2002:a24:d643:: with SMTP id o64mr4902862itg.148.1554223045649; 
	Tue, 02 Apr 2019 09:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190402152512.13112-1-ross.burton@intel.com>
In-Reply-To: <20190402152512.13112-1-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Apr 2019 17:37:14 +0100
Message-ID: <CAJTo0LZJ91qNM3sBju4Xzh4FNJWkMAj_CJuTr++0Un1kYQf+zg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] asciidoc: use local docbook XML catalogue
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
X-List-Received-Date: Tue, 02 Apr 2019 16:37:25 -0000
Content-Type: text/plain; charset="UTF-8"

Retracting this: it then goes and downloads the xsl stylesheets during
do_compile, which is slow and networking during a non-network phase.
Easier hack incoming.

Ross

On Tue, 2 Apr 2019 at 16:25, Ross Burton <ross.burton@intel.com> wrote:
>
> libxml-native by default uses a XML catalogue at /etc/xml/catalog, instead of
> the one in the sysroot.  Until this is fixed (#13260) override the XML catalogue
> manually in the recipe.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../asciidoc/asciidoc/auto-catalogs.patch          | 27 ++++++++++++++++++++++
>  meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb   |  7 +++++-
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch
>
> diff --git a/meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch b/meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch
> new file mode 100644
> index 00000000000..f507080cd3c
> --- /dev/null
> +++ b/meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch
> @@ -0,0 +1,27 @@
> +If SGML_CATALOG_FILES is in the environment, pass --catalogs to xmllint.
> +
> +Upstream-Status: Submitted [https://github.com/asciidoc/asciidoc-py3/issues/61]
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +diff --git a/a2x.py b/a2x.py
> +index 2d7699a..5bb995f 100755
> +--- a/a2x.py
> ++++ b/a2x.py
> +@@ -47,6 +47,8 @@ FOP = 'fop'                 # pdf generation (--fop option).
> + W3M = 'w3m'                 # primary text file generator.
> + LYNX = 'lynx'               # alternate text file generator.
> + XMLLINT = 'xmllint'         # Set to '' to disable.
> ++if "SGML_CATALOG_FILES" in os.environ:
> ++  XMLLINT += " --catalogs"
> + EPUBCHECK = 'epubcheck'     # Set to '' to disable.
> + # External executable default options.
> + ASCIIDOC_OPTS = ''
> +@@ -634,7 +636,7 @@ class A2X(AttrDict):
> +         shell('"%s" --backend docbook -a "a2x-format=%s" %s --out-file "%s" "%s"' %
> +              (self.asciidoc, self.format, self.asciidoc_opts, docbook_file, self.asciidoc_file))
> +         if not self.no_xmllint and XMLLINT:
> +-            shell('"%s" --nonet --noout --valid "%s"' % (XMLLINT, docbook_file))
> ++            shell('%s --nonet --noout --valid "%s"' % (XMLLINT, docbook_file))
> +
> +     def to_xhtml(self):
> +         self.to_docbook()
> diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> index d0d15171ac4..88ee93bfc10 100644
> --- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> +++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> @@ -8,7 +8,8 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
>                      file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
>
> -SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https"
> +SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
> +           file://auto-catalogs.patch"
>  SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
>  PV .= "+py3-git${SRCPV}"
>
> @@ -16,6 +17,10 @@ DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native"
>
>  S = "${WORKDIR}/git"
>
> +# Tell xmllint where to find the DocBook XML catalogue, because right now it
> +# opens /etc/xml/catalog on the host. Depends on auto-catalogs.patch
> +export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/docbook-xml.xml"
> +
>  # Not using automake
>  inherit autotools-brokensep
>  CLEANBROKEN = "1"
> --
> 2.11.0
>

