Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by mx.groups.io with SMTP id smtpd.web08.3181.1608572042463414056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 09:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mg.codeaurora.org header.s=smtp header.b=oePMjfu7;
 spf=pass (domain: mg.codeaurora.org, ip: 69.72.43.15, mailfrom: bounce+783715.be9e4a-openembedded-core=lists.openembedded.org@mg.codeaurora.org)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608572045; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bmhF13uQBHScZUbqFLVc5JC9Wg+QkuI2CoIDksGogBc=;
 b=oePMjfu7qWyd9fSlzgR8/5nICIhwOPMimtEE5prvJmaACdYOe7Xmx+MEN45anoPeHsu3FlYj
 JQunsPgtBHfTQJ9sMs8740p/mWfd41G7Evp6sHjnLh25D0zJbjPH08p1iJKbfqMsFrY6opcG
 8odhRTdqhDhIq/wHhYZI9dU7gOk=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJkODhiYiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fe0dc837bc801dc4fbfb680 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 17:33:55
 GMT
Sender: sbanerje=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 2684EC433C6; Mon, 21 Dec 2020 17:33:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sbanerje)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id BC9ADC433CA;
	Mon, 21 Dec 2020 17:33:53 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 21 Dec 2020 23:03:53 +0530
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] How to set the password Hashing Algorithm for root user to SHA256 or SHA512
In-Reply-To: <CAMKF1sokjzyb0kPZ1tmb1Anr5kD8GPZtVeoeWoWkqSYG=16a2g@mail.gmail.com>
References: <Groupsio.1.uzea.1608323419985389915.mRo2@lists.openembedded.org>
 <CAMKF1sokjzyb0kPZ1tmb1Anr5kD8GPZtVeoeWoWkqSYG=16a2g@mail.gmail.com>
Message-ID: <526da86d058f59fcef77cf1ab05af7f0@codeaurora.org>
X-Sender: sbanerje@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2020-12-20 10:16, Khem Raj wrote:
> On Sat, Dec 19, 2020 at 11:58 AM Sourabh Banerjee
> <sbanerje@codeaurora.org> wrote:
>> 
>> [Edited Message Follows]
>> 
>> The image I generated seems to use MD5 for root password hashing.
>> I understood this from the /etc/shadow file in the image., the file 
>> has following line:
>> 
>>     root:$1$b7X30f8f$au21weqL.9.ExM4N84AtA0:18614:0:99999:7:::
>> 
>> Is there an OE config I can change to change password hashing from MD5 
>> to SHA256?
>> 
> 
> somewhere you must be setting the password something like this in 
> local.conf
> 
> EXTRA_USERS_PARAMS += "\
>     useradd admin; \
>     usermod -p 'XXXXXX' admin; \
> "
> 
> Now how you generate the password could be done separately via
> 
> something like ( for setting password to me 'test' )
> 
> python3 -c 'import crypt; print(crypt.crypt("test",
> crypt.mksalt(crypt.METHOD_SHA256)))'
> 
> Replace XXXXXX with the output of the above cmd
> 
> aside from this its perhaps better to use sha512 than sha256
> 
>> I am using Thud version.
>> 
>> --
>> Regards,
>> Sourabh
>> 
>> 
>> 

Thanks Khem! I will try this and get back.


-- 
Regards,
Sourabh
