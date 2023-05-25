Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62466C77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 22:20:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.3514.1685053212185260683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 15:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KzfDt/tP;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34PMKBlH072036
	for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 17:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685053211;
	bh=0fXSV7cUdS/LWqJB41frHjKika34Pdc9ZmwWr0HKv3k=;
	h=Date:To:From:Subject;
	b=KzfDt/tPhtUzX6QCQoGhqrNC1eKSYd7yRa7nMuJCBSxwsx1dVmRKOQyUbqJWs7DLT
	 /OKYZx9mbDzjA9Ir1qtQyAuqihvNs9HfDfvj20cSewDe3EfecuXovwarPQeGO3SLr+
	 8C8mZ2HxtwNerouEQD26iSwImB8FRsh8T7eQs3BE=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34PMKBZ6024918
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 17:20:11 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 May 2023 17:20:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 May 2023 17:20:10 -0500
Received: from [10.249.39.16] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34PMKATp021372
	for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 17:20:10 -0500
Message-ID: <c2a13c69-dccd-948c-576c-dc86cbe2425d@ti.com>
Date: Thu, 25 May 2023 17:20:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: <openembedded-core@lists.openembedded.org>
From: Ryan Eatmon <reatmon@ti.com>
Subject: Parsing failure due to recent patch
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 22:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181726


I am seeing a parsing error with the meta-ti layer due to this recent 
change:

https://git.openembedded.org/openembedded-core/commit/?id=93a09a05d6dde3542587735df0aa2371e79a3bb7


We have the following lines in our files:

KERNEL_LOCALVERSION = 
"-g${@d.getVar('SRCPV',True).replace('AUTOINC+','')[:10]}"


UBOOT_LOCALVERSION = 
"-g${@d.getVar('SRCPV',True).replace('AUTOINC+','')[:10]}"


And when that patch is in place we now get this error:


ERROR: ExpansionError during parsing 
/scratch/builds/arago-master-wip/build/sources/meta-ti/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
Traceback (most recent call last):
   File 
"/scratch/builds/arago-master-wip/build/sources/bitbake/lib/bb/data_smart.py", 
line 460, in DataSmart.expandWithRefs(s='${@bb.fetch2.get_srcrev(d)}', 
varname='SRCPV'):
                      try:
     >                    s = 
__expand_python_regexp__.sub(varparse.python_sub, s)
                      except SyntaxError as e:
   File 
"/scratch/builds/arago-master-wip/build/sources/bitbake/lib/bb/data_smart.py", 
line 150, in VariableParse.python_sub(match=<re.Match object; span=(0, 
27), match='${@bb.fetch2.get_srcrev(d)}'>):
                          self.contains[k].update(parser.contains[k])
     >            value = utils.better_eval(codeobj, 
DataContext(self.d), {'d' : self.d})
                  return str(value)
   File 
"/scratch/builds/arago-master-wip/build/sources/bitbake/lib/bb/utils.py", 
line 434, in better_eval(source=<code object <module> at 0x7f4978634c90, 
file "Var <SRCPV>", line 1>, locals={'d': <bb.data_smart.DataSmart 
object at 0x7f49787dc970>}, extraglobals={'d': <bb.data_smart.DataSmart 
object at 0x7f49787dc970>}):
                  ctx[g] = extraglobals[g]
     >    return eval(source, ctx, locals)

   File "Var <SRCPV>", line 1, in <module>
   File 
"/scratch/builds/arago-master-wip/build/sources/bitbake/lib/bb/fetch2/__init__.py", 
line 784, in get_srcrev(d=<bb.data_smart.DataSmart object at 
0x7f49787dc970>, method_name='sortable_revision'):
          if not scms:
     >        raise FetchError("SRCREV was used yet no valid SCM was 
found in SRC_URI")

bb.data_smart.ExpansionError: Failure expanding variable SRCPV, 
expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception 
FetchError: Fetcher failure: SRCREV was used yet no valid SCM was found 
in SRC_URI
The variable dependency chain for the failure is: SRCPV -> 
UBOOT_LOCALVERSION -> do_compile

ERROR: Parsing halted due to errors, see error messages above


Any reference to SRCPV in those variables fails due to SRC_URI being 
cleared by the patch.



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

