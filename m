Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 35B106105E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 02:45:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8I2jeeE010028
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Sep 2013 19:45:40 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 17 Sep 2013 19:45:38 -0700
Message-ID: <523913CD.3080104@windriver.com>
Date: Wed, 18 Sep 2013 10:45:33 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1379148332.git.liezhi.yang@windriver.com>
	<3b4c037e41f6678845fb29d97aae5f48f07a68c7.1379148332.git.liezhi.yang@windriver.com>
	<CAJTo0LbRYeWRB-zOb3NvyH3ZtsOyQMeqKmm8a7xLCs7mpeG-jA@mail.gmail.com>
	<CAJTo0LZPhGjLrffo3coy_GSWLF+XhHpgyE6zTUxsPU30S72Z9Q@mail.gmail.com>
	<5237B876.2080203@windriver.com>
	<CAJTo0LY2DZn2WBhQMZiBe1KFHnpZwT+C6u742reGvE3GLY4LnQ@mail.gmail.com>
In-Reply-To: <CAJTo0LY2DZn2WBhQMZiBe1KFHnpZwT+C6u742reGvE3GLY4LnQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] telepathy-mission-control: do_compile failed (race issue)
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
X-List-Received-Date: Wed, 18 Sep 2013 02:45:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/17/2013 07:12 PM, Burton, Ross wrote:
> On 17 September 2013 03:03, Robert Yang <liezhi.yang@windriver.com> wrote:
>> I don't think that the commit you mentioned is a correct fix, he changed:
>>
>> gen/gtypes.h _gen/gtypes-body.h: _gen/stable-spec.xml
>>
>> To:
>>
>> gen/gtypes.h: _gen/gtypes-body.h
>>          @:
>> gen/gtypes-body.h: _gen/stable-spec.xml
>>
>> Now if we run "make gen/gtypes.h gen/gtypes-body.h", the gen/gtypes-body.h
>> will only run once, this is incorrect.
>
> But the Python script used in the second rule generates *both* files,

Ah, yes, thanks, what's your opinion on my patch ? Is it OK or should it be
re-worked ? I think that this fix is simple and easy to understand.

// Robert

> which is why the current rules in telepathy-mission-control are
> incorrect:
>
> ~/Local/mess/37/telepathy-mission-control/src
> $ ls _gen/gtypes*
> _gen/gtypes-body.h  _gen/gtypes.h
>
> ~/Local/mess/37/telepathy-mission-control/src
> $ rm _gen/gtypes* -f
>
> ~/Local/mess/37/telepathy-mission-control/src
> $ make _gen/gtypes.h
> /usr/bin/python ../tools/glib-gtypes-generator.py \
> _gen/mcd.xml _gen/gtypes mc
>
> ~/Local/mess/37/telepathy-mission-control/src
> $ ls _gen/gtypes*
> _gen/gtypes-body.h  _gen/gtypes.h
>
> The anti-pattern of:
>
> foo bar:
>    this-script-generates-both-files.sh
>
> is wrong in parallel builds.
>
> Ross
>
>

