Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 54148731C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 15:47:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0PFlJtE019522
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Jan 2016 07:47:19 -0800 (PST)
Received: from server.local (128.224.22.131) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jan 2016 07:47:18 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1453734454.25948.13.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <56A64385.1020804@windriver.com>
Date: Mon, 25 Jan 2016 10:47:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453734454.25948.13.camel@linuxfoundation.org>
Subject: Re: [PATCH] kernel: Clean DEPLOYDIR before do_deploy runs
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
X-List-Received-Date: Mon, 25 Jan 2016 15:47:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-01-25 10:07 AM, Richard Purdie wrote:
> If we don't do this, the deploy sstate object contains an every
> increasing number of modules tarballs and kernel images, one per
> execution of "-c deploy -f".
>

Stupid question, since my sstate/deploy foo is weak at times.
Does this mean that only a single set of modules + kernel images
will be in tmp/deploy ? Or is it only sstate that is being
cleaned ?

I sometimes need multiple copies around for debug purposes, so
I'm wondering if that is still possible with this change ?

Bruce

> Cleaning the directory before we start makes things much tidier.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index dee6f7d..f37affc 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -511,6 +511,7 @@ kernel_do_deploy() {
>   		ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
>   	fi
>   }
> +do_deploy[cleandirs] = "${DEPLOYDIR}"
>   do_deploy[dirs] = "${DEPLOYDIR} ${B}"
>   do_deploy[prefuncs] += "package_get_auto_pr"
>
>
>


