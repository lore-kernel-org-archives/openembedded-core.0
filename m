Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 469C07F2F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 20:09:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x78K9D52011148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2019 13:09:13 -0700 (PDT)
Received: from [192.168.10.15] (147.11.117.63) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 13:09:12 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190808125509.120784-1-jason.wessel@windriver.com>
	<572463162f995f87c9bd0d48db6541a34c8dd2a8.camel@linuxfoundation.org>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <2917ac7f-96da-1e57-5f4f-0153d8a5bae4@windriver.com>
Date: Thu, 8 Aug 2019 15:09:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <572463162f995f87c9bd0d48db6541a34c8dd2a8.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/4] image_types_wic.bbclass: Copy the .wks and .env files to deploy image dir
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
X-List-Received-Date: Thu, 08 Aug 2019 20:09:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/8/19 1:42 PM, Richard Purdie wrote:
> On Thu, 2019-08-08 at 05:55 -0700, Jason Wessel wrote:
>> When using a .wks.in file, the only place that the generated .wks file
>> exists in the tmp/work area.  A copy should be left behind in the
>> deploy directory so that you can easily run the wic tool to
>> re-generate or modify a new image without running bitbake.  Custom
>> .wks.in files can reference any number of bitbake variables, so it is
>> important to save the result.
>>
>> below is an example of using the generated .wks file in the deploy
>> area.  The full name of my generated .wks file was
>> core-image-minimal-ostree-uboot-ab.wks, but since you usually only
>> have a single .wks file per image you can use a wild card like:
>>
>>    cd tmp*/deploy/images/*
>>    wic create --vars . -e core-image-minimal -s -m core-image-minimal-*.wks
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>   meta/classes/image_types_wic.bbclass | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
>> index 519aeb1b04..ce94138b3c 100644
>> --- a/meta/classes/image_types_wic.bbclass
>> +++ b/meta/classes/image_types_wic.bbclass
>> @@ -77,6 +77,11 @@ python do_write_wks_template () {
>>       wks_file = d.getVar('WKS_FULL_PATH')
>>       with open(wks_file, 'w') as f:
>>           f.write(template_body)
>> +    f.close()
>> +    # Copy the finalized wks file to the deploy directory for later use
>> +    depdir = d.getVar('DEPLOY_DIR_IMAGE')
>> +    basename = d.getVar('IMAGE_BASENAME')
>> +    bb.utils.copyfile(wks_file, "%s/%s" % (depdir, basename + '-' + os.path.basename(wks_file)))
>>   }
> 
> Nothing should be writing to DEPLOY_DIR_IMAGE directly as it means its
> not being managed by sstate and won't restore in a build from sstate.
> There is an intermediate directory it should be written to and the
> sstate code will put it into DEPLOY_DIR_IMAGE. For image classes it
> might be IMGDEPLOYDIR but you'd have to check this task/code runs
> between do_image and do_image_complete.
> 


Thank you for the pointer.  It works exactly as intended so long as the dependency
is changed properly, and the correct staging directory is used.
There is no directory creation required because the do_image() takes care of all
that.

I'll send v2 of the series, but this this the only patch that changed.

Jason.

