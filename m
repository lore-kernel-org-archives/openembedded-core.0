Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DAA5271DDE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 03:33:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1H3XG30020712
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Feb 2017 19:33:16 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Feb 2017 19:33:15 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1487139819.git.liezhi.yang@windriver.com>
	<5f59a24d85e3226f7fa878f3fac5b88afbe1b0fc.1487139819.git.liezhi.yang@windriver.com>
	<20170216105623.GA3621@jama>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <6e0be2d7-a5ea-46d8-a1bb-b9caaa696abb@windriver.com>
Date: Fri, 17 Feb 2017 11:33:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20170216105623.GA3621@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] binconfig.bbclass: fix get_binconfig_mangle()
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
X-List-Received-Date: Fri, 17 Feb 2017 03:33:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/16/2017 06:56 PM, Martin Jansa wrote:
> On Tue, Feb 14, 2017 at 10:25:11PM -0800, Robert Yang wrote:
>> The command was:
>> s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
>> s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
>> s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
>> s += " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
>> s += " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
>> s += " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
>>
>> The STAGING_LIBDIR and STAGING_INCDIR now contains WORKDIR, so the
>> result would be incorrect like:
>> TCL_INCLUDE_SPEC='-IFIXMESTAGINGDIRTARGET/usr/include/recipe-sysroot/usr/include/tcl8.6'
>>
>> Note, the "/usr/include/recipe-sysroot" is not needed. Move the last two
>> sed commands ahead will fix the problem.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/classes/binconfig.bbclass | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
>> index 5372294..1be5fc4 100644
>> --- a/meta/classes/binconfig.bbclass
>> +++ b/meta/classes/binconfig.bbclass
>> @@ -13,14 +13,14 @@ def get_binconfig_mangle(d):
>>          s += " -e 's:=%s${exec_prefix}/:=\\1OEEXECPREFIX/:'" % optional_quote
>>          s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
>>          s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
>> +        s += " -e 's:-L${WORKDIR}:-LOELIBDIR:'"
>> +        s += " -e 's:-I${WORKDIR}:-I-IOEINCDIR:'"
>
> Is the "-I-I" intentional?

Sorry, it's a typo, updated in the repo:

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index 5372294..39c3e2b 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -13,14 +13,14 @@ def get_binconfig_mangle(d):
          s += " -e 's:=%s${exec_prefix}/:=\\1OEEXECPREFIX/:'" % optional_quote
          s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
          s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
+        s += " -e 's:-L${WORKDIR}:-LOELIBDIR:'"
+        s += " -e 's:-I${WORKDIR}:-IOEINCDIR:'"
          s += " -e 's:OEBASELIBDIR:${STAGING_BASELIBDIR}:;'"
          s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
          s += " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
          s += " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
          s += " -e 's:OEPREFIX:${STAGING_DIR_HOST}${prefix}:'"
          s += " -e 's:OEEXECPREFIX:${STAGING_DIR_HOST}${exec_prefix}:'"
-        s += " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
-        s += " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
          if d.getVar("OE_BINCONFIG_EXTRA_MANGLE", False):
              s += d.getVar("OE_BINCONFIG_EXTRA_MANGLE")

// Robert

>
>>          s += " -e 's:OEBASELIBDIR:${STAGING_BASELIBDIR}:;'"
>>          s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
>>          s += " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
>>          s += " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
>>          s += " -e 's:OEPREFIX:${STAGING_DIR_HOST}${prefix}:'"
>>          s += " -e 's:OEEXECPREFIX:${STAGING_DIR_HOST}${exec_prefix}:'"
>> -        s += " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
>> -        s += " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
>>          if d.getVar("OE_BINCONFIG_EXTRA_MANGLE", False):
>>              s += d.getVar("OE_BINCONFIG_EXTRA_MANGLE")
>>
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

