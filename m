Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3837079B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 07:57:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s717vJK6022294
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Aug 2014 00:57:19 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 1 Aug 2014 00:57:19 -0700
Message-ID: <53DB485C.9070504@windriver.com>
Date: Fri, 1 Aug 2014 15:57:16 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <cover.1406876955.git.Chong.Lu@windriver.com>
	<26c2d48cccb6fb2dfe6dd00dbb4ab191b7bd2b4d.1406876955.git.Chong.Lu@windriver.com>
	<alpine.LFD.2.11.1408010337001.31066@localhost>
In-Reply-To: <alpine.LFD.2.11.1408010337001.31066@localhost>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] oelint.bbclass: Check for ${PN} or ${P} usage
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
X-List-Received-Date: Fri, 01 Aug 2014 07:57:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 08/01/2014 03:37 PM, Robert P. J. Day wrote:
> On Fri, 1 Aug 2014, Chong Lu wrote:
>
>> Check for ${PN} or ${P} usage in SRC_URI or S.
>> We should use ${BPN} or ${BP} instead to avoid breaking multilib.
>>
>> [YOCTO #5427]
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   meta/classes/oelint.bbclass | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
>> index 0bed74a..685a88d 100644
>> --- a/meta/classes/oelint.bbclass
>> +++ b/meta/classes/oelint.bbclass
>> @@ -62,4 +62,24 @@ python do_lint() {
>>                       bb.warn("${PN}: %s doesn't have Signed-off-by" % item)
>>                   if findKey(path, "Upstream-Status"):
>>                       bb.warn("${PN}: %s doesn't have Upstream-Status" % item)
>> +
>> +
>> +    ##############################
>> +    # Check for ${PN} or ${P} usage in SRC_URI or S
>> +    # Should use ${BPN} or ${BP} instead to avoid breaking multilib
>> +    #
>> +    s = d.getVar("SRC_URI").split()
>> +
>> +    for srcurl in s:
>> +        if not srcurl.startswith("file://"):
>> +            if not srcurl.find("{PN}") == -1:
>> +                bb.warn("${PN}: Should use BPN instead to PN in SRC_URI")
>> +            if not srcurl.find("{P}") == -1:
>    should you not say, "use BPN instead of PN ..."?
>
> rday
OK, thanks.
I will change this and resend a V2.

Best Regards
Chong


