Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 35FE06B0CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 18:17:16 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j6so1514378oag.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 11:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=+QHh4mHvcDSRf5QUUjX2KfkHicnd7wEetGMY36/WmXg=;
	b=lTuNqcgcjR0z4vCZWO1yZgmzJ2fokPz5+515ReyPojqV8H54jlzovT2smhKy+LCc5l
	vTn6llhjBIlF90wvLU9KY+/7KECHYpdQ33ThAL22kNClXOEKntEbWN8RENA+K2ET/OYb
	q64e3Kabst+lL7poohuj3KY7UpUCxdqsDq+ztFT1+RWz0uD00ZXU9TY8eMqXEMDBZQnB
	T5NbUg1psxnwBuEmszNv58DuIHmEoWI89Umz30xy6TDxr1e2Ak6601a5tKASThH1eget
	wIkJQBTdWWekFcpvFUM0Ljgvzjm4jMW+3V7c/3uWNP6lov7F/Lhy75oBHA058BQVKXsV
	wndg==
MIME-Version: 1.0
X-Received: by 10.182.81.65 with SMTP id y1mr2562759obx.89.1377022636430; Tue,
	20 Aug 2013 11:17:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 20 Aug 2013 11:17:16 -0700 (PDT)
In-Reply-To: <1377017488-32708-3-git-send-email-fcooper@ti.com>
References: <1377017488-32708-1-git-send-email-fcooper@ti.com>
	<1377017488-32708-3-git-send-email-fcooper@ti.com>
Date: Tue, 20 Aug 2013 15:17:16 -0300
X-Google-Sender-Auth: wK0VvoQEQhn1fBQKm94sH2MbR2k
Message-ID: <CAP9ODKp7OF=yREqDpGhqcSRNdYAC9+S_SsRhoE6KPR4bJR5V9Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>, "Eggleton,
	Paul" <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for dylan][PATCH 3/3] linux-dtb.inc: Fix dtb generation for kernels newer than 3.8
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
X-List-Received-Date: Tue, 20 Aug 2013 18:17:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 20, 2013 at 1:51 PM, Franklin S. Cooper Jr <fcooper@ti.com> wrote:
> From: Otavio Salvador <otavio@ossystems.com.br>
>
> The 3.8 kernel has change the default directory where the dtb file is
> stored. The change has been done at:
>
> ,----[ Quote of 3.8 kernel change ]
> | commit 499cd8298628eeabf0eb5eb6525d4faa0eec80d8
> | Author: Grant Likely <grant.likely@secretlab.ca>
> | Date:   Tue Nov 27 16:29:11 2012 -0700
> |
> |     ARM: dt: change .dtb build rules to build in dts directory
> |
> |     The current rules have the .dtb files build in a different directory
> |     from the .dts files. The only reason for this is that it was what
> |     PowerPC has done historically. This patch changes ARM to use the generic
> |     dtb rule which builds .dtb files in the same directory as the source .dts.
> |
> |     Cc: Russell King <linux@arm.linux.org.uk>
> |     Cc: Arnd Bergmann <arnd@arndb.de>
> |     Acked-by: Olof Johansson <olof@lixom.net>
> |     Cc: linux-arm-kernel@lists.infradead.org
> |     Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> |     [swarren: added rm command for old stale .dtb files]
> |     Signed-off-by: Stephen Warren <swarren@nvidia.com>
> |     Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> `----
>
> This change adds support for both places to backward and forward
> compatibility.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Franklin, I agree this is the way to go but I think it is a bit risky
to change it in dylan.

I think it could be included in meta-ti or other layers (in case it is
need for dylan) but it has breakage risk as noticed today in some
behaviour change as found in meta-xilinx.

Paul, please be conservative about this and my previous linux-dtb
patch. In case it is going to be applied in dylan we need to let it
sleep some more time in master to find any other side effect due the
behaviour change.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

