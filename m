Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by mx.groups.io with SMTP id smtpd.web12.1057.1602607906854537788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 09:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mg.codeaurora.org header.s=smtp header.b=SoZt8FhL;
 spf=pass (domain: mg.codeaurora.org, ip: 69.72.42.4, mailfrom: bounce+783715.be9e4a-openembedded-core=lists.openembedded.org@mg.codeaurora.org)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602607907; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=laB7TFYseQU/Df+UYS5AEjntSbY4urBrInbuCRQNYWg=;
 b=SoZt8FhLDvmmqg0Ib5SD0WkxZSQQqHQe23jnGGZ0ZYpecMw6DryG3BvnRvu5+cOfjQ6d1kjF
 WEJv8wRxUss351U4aouWx7LCkTUp0QuMUYhTs5MQhSSob4Yyi2240hIYtfVXgUSTD3Rxmdd9
 RVAAPsd7J/1L3yldVBkYkRmcdZA=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkODhiYiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f85db204f8cc67c3101a07e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 16:51:44
 GMT
Sender: sbanerje=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 0C5D2C433F1; Tue, 13 Oct 2020 16:51:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sbanerje)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 12586C433CB;
	Tue, 13 Oct 2020 16:51:43 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 13 Oct 2020 22:21:42 +0530
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] layer.conf: fix sanity error for PATH variable in extensible SDK workflow
In-Reply-To: <70e6251e77a670b27d5f615f17b5e6ade4b9af90.camel@linuxfoundation.org>
References: <1602403005-20733-1-git-send-email-sbanerje@codeaurora.org>
 <70e6251e77a670b27d5f615f17b5e6ade4b9af90.camel@linuxfoundation.org>
Message-ID: <9445ff91e98706a197bf917a1cee448e@codeaurora.org>
X-Sender: sbanerje@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2020-10-13 14:32, Richard Purdie wrote:
> On Sun, 2020-10-11 at 13:26 +0530, Sourabh Banerjee wrote:
>> Sanity checker reports following error for the PATH variable,
>> when bitbake -e <recipe> command is run in an extensible SDK 
>> workspace.
>>    PATH contains '.', './' or '' (empty element), which will break the 
>> build
>> 
>> In case of extensible SDK, PATH variable is formed with two 
>> consecutive ':'
>> as bb.utils.which(d.getVar('PATH'),'bitbake') call returns an empty 
>> string.
>> 
>> This change adds the ':' only if the 
>> bb.utils.which(d.getVar('PATH'),'bitbake')
>> returns a valid path.
>> 
>> Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
>> ---
>>  meta/conf/layer.conf | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>> 
>> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>> index 38df0f3..75d2ee0 100644
>> --- a/meta/conf/layer.conf
>> +++ b/meta/conf/layer.conf
>> @@ -102,4 +102,12 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
>>  SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
>> 
>>  # We need to keep bitbake tools in PATH
>> -PATH := 
>> "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
>> +# The ':' separator is conditionally added only if 'bitbake' is in 
>> environment.
>> +# In case of extensible SDK, bitbake is not in environment, which 
>> results in
>> +# two consecutive ':'. Sanity checker reports "empty element" error 
>> when it
>> +# encounters two consecutive ':' for PATH variable in the extensible 
>> SDK.
>> +PATH := "\
>> +${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}\
>> +${@(':', '')[bb.utils.which(d.getVar('PATH'),'bitbake') is ""]}\
>> +${HOSTTOOLS_DIR}\
>> +"
> 
> I think we need to try and find something a little neater than this.
> How about:
> 
> # Need to avoid empty path entries
> BITBAKEPATH := 
> "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
> PATH := "${@'${BITBAKEPATH}:' if ${BITBAKEPATH} is not 
> ""}${HOSTTOOLS_DIR}"

Hi Richard,

Uploaded patch v3 here 
https://lists.openembedded.org/g/openembedded-core/message/143292
I observed following error if I used your suggestion as is.

		ERROR: Unable to parse 
/workspace/sbanerje/MASTER/poky/bitbake/lib/bb/data_smart.py
		Traceback (most recent call last):
		  File "/workspace/sbanerje/MASTER/poky/bitbake/lib/bb/data_smart.py", 
line 114, in VariableParse.python_sub(match=<_sre.SRE_Match object; 
span=(0, 127), 
match='${@\'/local/mnt/workspace/sbanerje/MASTER/poky/bi>):
							 varname = '<expansion>'
			>            codeobj = compile(code.strip(), varname, "eval")

		bb.data_smart.ExpansionError: Failure expanding variable PATH[:=], 
expression was ${@'/workspace/sbanerje/MASTER/poky/bitbake/bin:' if 
/workspace/sbanerje/MASTER/poky/bitbake/bin is not ""}${HOSTTOOLS_DIR} 
which triggered exception SyntaxError: invalid syntax (Var <PATH[:=]>, 
line 1)

I figured, only way to get around this is to add 'else'.

> 
> Cheers,
> 
> Richard


-- 
Regards,
Sourabh
