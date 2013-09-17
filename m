Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8540F6BFF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 02:03:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8H23eSv017360
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Sep 2013 19:03:40 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 16 Sep 2013 19:03:39 -0700
Message-ID: <5237B876.2080203@windriver.com>
Date: Tue, 17 Sep 2013 10:03:34 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1379148332.git.liezhi.yang@windriver.com>
	<3b4c037e41f6678845fb29d97aae5f48f07a68c7.1379148332.git.liezhi.yang@windriver.com>
	<CAJTo0LbRYeWRB-zOb3NvyH3ZtsOyQMeqKmm8a7xLCs7mpeG-jA@mail.gmail.com>
	<CAJTo0LZPhGjLrffo3coy_GSWLF+XhHpgyE6zTUxsPU30S72Z9Q@mail.gmail.com>
In-Reply-To: <CAJTo0LZPhGjLrffo3coy_GSWLF+XhHpgyE6zTUxsPU30S72Z9Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 Sep 2013 02:03:38 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/17/2013 07:49 AM, Burton, Ross wrote:
> On 17 September 2013 00:08, Burton, Ross <ross.burton@intel.com> wrote:
>>> This is a race issue, the _gen/gtypes.h and _gen/gtypes-body.h may
>>> write(remove/rename) _gen/gtypes.tmp at the same time, then there would
>>> be the error.
>>>
>>> Use ".NOTPARALLEL: _gen/gtypes.h _gen/gtypes-body.h" will fix the
>>> problem.
>>
>> This is going to be a game of whack-a-mole as the root cause is the
>> bad temporary filename assignment in libtpcodegen.py.  Is there an
>> upstream bug for this?
>
> Had a quick look - there's a trivial race in the utility code that a
> bit of tempfile can fix, but the more correct fix for
> telepathy-mission-control is to do the same fix that telepathy-glib
> did here:
>
> http://cgit.freedesktop.org/telepathy/telepathy-glib/commit/?id=36c2a545c9c1d1cc6db205bfc33d980d29b0a0f6

I don't think that the commit you mentioned is a correct fix, he changed:

gen/gtypes.h _gen/gtypes-body.h: _gen/stable-spec.xml

To:

gen/gtypes.h: _gen/gtypes-body.h
	@:
gen/gtypes-body.h: _gen/stable-spec.xml

Now if we run "make gen/gtypes.h gen/gtypes-body.h", the gen/gtypes-body.h
will only run once, this is incorrect. And this fix has been dropped in the
up to date source.

// Robert

>
> https://bugs.freedesktop.org/show_bug.cgi?id=69446 is the upstream bug
> I just filed for this.
>
> Ross
>
>

