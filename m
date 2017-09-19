Return-Path: <prvs=4282363e9=mnhu@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id 79DB9781A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 09:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=1833; q=dns/txt;
	s=ironport2; t=1505813051; x=1537349051;
	h=subject:to:references:from:cc:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=7qmFD7Qz8wcdcSDvp9R1BtkMAe/+H9JXFD/g5WdoTF0=;
	b=QMSTZ5WfxAR/e+j+CZOxdc0PTNKz8KfVhIu3mQDioCDySE5nyQdYIyTT
	+ERPqgelXIpgMzjM3qSsTkrr5lDszbLCraG+gm683BT3GPtkh+n1aR9G8
	i088qXVS/3SKXglRBybtXfunNtObOjmqXN8roN4N34sC2OXP7gGvrDv81 E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2F7AABP4cBZ/+iTuFUNTxkBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYlInAuYNwqFOwKFGBQBAgEBAQEBAQEDhikBAQEDIxVBEAsNAQo?=
	=?us-ascii?q?CAiYCAlcGDQgBAYoiqQhrgiciiwUBAQEBAQEBAwEBAQEkgQ6CHYVggn2IC4JBH?=
	=?us-ascii?q?wWhC5RWi26HC5U3gTk2gS8yKTGFYR2BaYlPAQEB?=
X-IPAS-Result: =?us-ascii?q?A2F7AABP4cBZ/+iTuFUNTxkBAQEBAQEBAQEBAQcBAQEBAYl?=
	=?us-ascii?q?InAuYNwqFOwKFGBQBAgEBAQEBAQEDhikBAQEDIxVBEAsNAQoCAiYCAlcGDQgBA?=
	=?us-ascii?q?YoiqQhrgiciiwUBAQEBAQEBAwEBAQEkgQ6CHYVggn2IC4JBHwWhC5RWi26HC5U?=
	=?us-ascii?q?3gTk2gS8yKTGFYR2BaYlPAQEB?=
X-IronPort-AV: E=Sophos;i="5.42,417,1500933600"; 
   d="scan'208";a="2495034"
Received: from unknown (HELO [10.0.0.232]) ([85.184.147.232])
	by mail02.prevas.se with ESMTP/TLS/DHE-RSA-AES128-SHA;
	19 Sep 2017 11:23:34 +0200
To: Tom Rini <trini@konsulko.com>
References: <1500674794-23258-1-git-send-email-trini@konsulko.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <8eec536c-80b0-3a8a-a7dd-d96c3bd34006@prevas.dk>
Date: Tue, 19 Sep 2017 11:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1500674794-23258-1-git-send-email-trini@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.bbclass: Correct chaining compression support
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
X-List-Received-Date: Tue, 19 Sep 2017 09:24:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-IE
Content-Transfer-Encoding: 7bit

Hi Tom,

On 2017-07-22 00:06, Tom Rini wrote:
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index de535ce6fcff..bd6a5b7b810a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -453,7 +453,7 @@ python () {
>           rm_tmp_images = set()
>           def gen_conversion_cmds(bt):
>               for ctype in ctypes:
> -                if bt[bt.find('.') + 1:] == ctype:
> +                if bt.endswith("." + ctype):
>                       type = bt[0:-len(ctype) - 1]
>                       if type.startswith("debugfs_"):
>                           type = type[8:]

This is the change that in fact messes with our cpio.gz.u-boot image 
types, causing base hash changes.

I suspect the changed if-check to be too permissive. In our case, it now 
matches any ctype that ends with ".u-boot", and not just "gz.u-boot" as 
set in IMAGE_FSTYPES.

Wouldn't it be correct to match on the entire bt variable? I.e.

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass 

index ef2b38aeaf..818932f7f1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -454,7 +454,7 @@ python () {
          rm_tmp_images = set()
          def gen_conversion_cmds(bt):
              for ctype in ctypes:
-                if bt.endswith("." + ctype):
+                if bt.split('.', 1) == [t, ctype]:
                      type = bt[0:-len(ctype) - 1]
                      if type.startswith("debugfs_"):
                          type = type[8:]

This works for me, preliminary tested with the following fs types 
configured:

	IMAGE_FSTYPES = "cpio.gz.u-boot"
	IMAGE_FSTYPES = "tar cpio cpio.gz cpio.gz.u-boot"
	IMAGE_FSTYPES = "tar cpio cpio.gz cpio.gz.u-boot tar.bz2 jffs2 wic 
wic.bmap"

// Martin

