Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.414.1591729677229514048
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 12:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 49E7640C06;
	Tue,  9 Jun 2020 19:07:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hP86QnDSLH02; Tue,  9 Jun 2020 19:07:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2CA3840A35;
	Tue,  9 Jun 2020 19:07:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7C3F217320C; Tue,  9 Jun 2020 15:07:54 -0400 (EDT)
Date: Tue, 9 Jun 2020 15:07:54 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] wic: Fix --extra-space argument handling
Message-ID: <20200609190754.GU17660@denix.org>
References: <20200609171631.21796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200609171631.21796-1-JPEWhacker@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2020 at 12:16:31PM -0500, Joshua Watt wrote:
> 467f84e12b ("wic: Add --offset argument for partitions") broke the
> --extra-space argument handling in wic. Fix the option and add a unit
> test for the argument.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

Tested-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta/lib/oeqa/selftest/cases/wic.py | 15 +++++++++++++++
>  scripts/lib/wic/ksparser.py         |  2 +-
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index 9e7be6168e..8b58285c32 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -908,6 +908,21 @@ class Wic2(WicTestCase):
>              p, _ = self._get_wic_partitions(tempf.name, ignore_status=True)
>              self.assertNotEqual(p.status, 0, "wic exited successfully when an error was expected:\n%s" % p.output)
>  
> +    def test_extra_space(self):
> +        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
> +
> +        with NamedTemporaryFile("w", suffix=".wks") as tempf:
> +            tempf.write("bootloader --ptable gpt\n" \
> +                        "part /     --source rootfs --ondisk hda --extra-space 200M --fstype=ext4\n")
> +            tempf.flush()
> +
> +            _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
> +            self.assertEqual(len(partlns), 1)
> +            size = partlns[0].split(':')[3]
> +            self.assertRegex(size, r'^[0-9]+kiB$')
> +            size = int(size[:-3])
> +            self.assertGreaterEqual(size, 204800)
> +
>      @only_for_arch(['i586', 'i686', 'x86_64'])
>      def test_rawcopy_plugin_qemu(self):
>          """Test rawcopy plugin in qemu"""
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 05ae292ef5..3453d9cb9d 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -145,7 +145,7 @@ class KickStart():
>          part.add_argument('--exclude-path', nargs='+')
>          part.add_argument('--include-path', nargs='+', action='append')
>          part.add_argument('--change-directory')
> -        part.add_argument("--extra-space", type=sizetype)
> +        part.add_argument("--extra-space", type=sizetype("M"))
>          part.add_argument('--fsoptions', dest='fsopts')
>          part.add_argument('--fstype', default='vfat',
>                            choices=('ext2', 'ext3', 'ext4', 'btrfs',
> -- 
> 2.26.2
> 
