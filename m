Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6D66D3A7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 17:23:34 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id jx11so10481672veb.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2013 09:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=LN3fZTZQlnQaAhf/j1KTt72BWT72CSRvHP74tB9pHek=;
	b=USCAm4KTElc5K6Sje2+s6PrERCnx8RH29sLj6NMJxmVV7SoS0VS+Er+srvs/EFarzg
	n+e6SDVI4bcIiMh4eO6DbLc8xMHyzt/v+BINQsH5oGtmBrHLsQqeqbZbutv0CfXHhsXY
	XgNcA5zt9ehs/5W9WhPjeEcLulA541v7hI6sNaHGlpf9Vttj8+6H4wiy/yNp1HGbrk45
	anb2d9xXcz1Vl98oHuejGZohbUuL8TyJi6VGURZlYUjjMoPryYWuioS044kT4k6pVHyB
	csts/ZZKGZ3Kr8hTdGT21gVzpuAsarJlmJJ4Po37wanPArHysRc4H3sAmBLh0bJ4Um2k
	WtMQ==
X-Gm-Message-State: ALoCoQnIDiKW+lC1tXIjl4MV9TXk4Ldg+4P6DixuekQl6PNf7a0Cl1h6Y6EV69dF2E2Fi0VMRyP6
X-Received: by 10.52.186.228 with SMTP id fn4mr4505307vdc.34.1386091413224;
	Tue, 03 Dec 2013 09:23:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 3 Dec 2013 09:23:12 -0800 (PST)
In-Reply-To: <1386091317-11014-1-git-send-email-ross.burton@intel.com>
References: <1386091317-11014-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Dec 2013 17:23:12 +0000
Message-ID: <CAJTo0LZ1z_0p=iHUm2CTy1ZwA9ANkUaB219imVET1=umbwYrJw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ptest: ensure do_install_ptest_base task runs in fakeroot context
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
X-List-Received-Date: Tue, 03 Dec 2013 17:23:36 -0000
Content-Type: text/plain; charset=UTF-8

I should add that this fixes problems like systemd failing rebuilds
with crazy errors like:

| tar: sysroot-destdir/usr/lib/systemd/ptest/test/sys/module/uhci_hcd/drivers/pci\:uhci_hcd:
Cannot open: Permission denied

Ross

On 3 December 2013 17:21, Ross Burton <ross.burton@intel.com> wrote:
> As this task is installing files into $D it needs to run inside pseudo so that
> special permissions and owners are preserved.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/ptest.bbclass |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
> index 508ea9a..06dddf7 100644
> --- a/meta/classes/ptest.bbclass
> +++ b/meta/classes/ptest.bbclass
> @@ -53,3 +53,8 @@ do_install_ptest_base[cleandirs] = "${D}${PTEST_PATH}"
>  addtask configure_ptest_base after do_configure before do_compile
>  addtask compile_ptest_base   after do_compile   before do_install
>  addtask install_ptest_base   after do_install   before do_package
> +
> +python () {
> +    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
> +        d.setVarFlag('do_install_ptest_base', 'fakeroot', 1)
> +}
> --
> 1.7.10.4
>

