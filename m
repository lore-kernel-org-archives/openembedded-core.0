Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D08A6E9A3
	for <Openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2014 14:00:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s11E0VwQ027414
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 1 Feb 2014 06:00:31 -0800 (PST)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Sat, 1 Feb 2014 06:00:31 -0800
Message-ID: <52ECFDFE.90302@windriver.com>
Date: Sat, 1 Feb 2014 08:00:30 -0600
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>	
	<1390487566-13569-2-git-send-email-jason.wessel@windriver.com>
	<1391246532.28575.23.camel@ted>
In-Reply-To: <1391246532.28575.23.camel@ted>
X-Enigmail-Version: 1.6
Cc: "saul.wold" <saul.wold@intel.com>, Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/6] unfs3: Add a NFSv3 user mode server for use with runqemu
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
X-List-Received-Date: Sat, 01 Feb 2014 14:00:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 02/01/2014 03:22 AM, Richard Purdie wrote:
> Hi Jason,
>
> We're seeing a parallel make race on the autobuilder and it seems its
> from this patch:

You actually still need the patch or you get a different parallel build error with the lib file.  I tracked down the regression from the original.

The original patch looks like:

--- a/Config/Makefile.in
+++ b/Config/Makefile.in
@@ -12,7 +12,9 @@ all: lib.a
 lib.a: $(OBJS)
        $(AR) crs lib.a $(OBJS)
 
-y.tab.h y.tab.c: exports.y
+y.tab.h: y.tab.c
+
+y.tab.c: exports.y
        $(YACC) -d exports.y


So I am thinking something was "lost in porting/translation".  I'll send you a patch shortly.  Thanks for the pointer to the build error.

Cheers,
Jason.


