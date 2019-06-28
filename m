Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2D37E900
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 07:08:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5S787OI009466
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Jun 2019 00:08:07 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Fri, 28 Jun 2019 00:08:07 -0700
To: Matt Madison <matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
	<20180304210937.29727-7-matt@madison.systems>
	<5D0C9F8B.8060109@windriver.com>
	<CAGgRHJoXVPEq-L9iHniD9mQtvC3CGq3-jP7NincOx1gVqCps3g@mail.gmail.com>
	<5D1335A3.6060508@windriver.com>
	<CAGgRHJozBOK+JH3uFQ-=utkTk97Gqg0N1yH2vdgC8-z6cQwUNA@mail.gmail.com>
	<5D1465AA.2050401@windriver.com>
	<CAGgRHJqHLmiga8CAj7od2OuqRc2MKcnc0cGuXFc1SgMSOMrGGQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D15BDDE.1090003@windriver.com>
Date: Fri, 28 Jun 2019 15:12:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAGgRHJqHLmiga8CAj7od2OuqRc2MKcnc0cGuXFc1SgMSOMrGGQ@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 06/13] go.bbclass: ptest cleanup and improvements
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
X-List-Received-Date: Fri, 28 Jun 2019 07:08:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年06月27日 19:34, Matt Madison wrote:
> On Wed, Jun 26, 2019 at 11:40 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>>
>>
>> On 2019年06月26日 22:00, Matt Madison wrote:
>>> On Wed, Jun 26, 2019 at 2:02 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2019年06月25日 20:23, Matt Madison wrote:
>>>>> On Fri, Jun 21, 2019 at 2:08 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>>>>
>>>>>> Hi Matt,
>>>>>>
>>>>>> I noticed your commit is the latest update for go-dep ptest. But the
>>>>>> go-dep ptest doesn't work in my environment. I'm trying to figure out
>>>>>> what's wrong is here though I didn't know much about go.
>>>>>
>>>>> I went back over the commits, and I don't think I did anything with
>>>>> go-dep specifically. I can see that the tests are failing for it, and
>>>>> it looks like it's because go-dep's test programs make some
>>>>> assumptions about the environment.  For one thing, it needs the go
>>>>> compiler installed. It also looks like it's expecting some source
>>>>> files to be present... in other words, it's not really designed for a
>>>>> cross-build setup, with tests run on the cross-built target. It could
>>>>> be messy to work around that, and I'm not sure how useful it would be
>>>>> anyway, seeing as how go-dep is more of a build tool.  Might be better
>>>>> to just disable ptests for it completely.
>>>>
>>>> Many thanks Matt for your information!
>>>> Did you ever run go-dep ptest?
>>>> Go through the run-ptest script for go-dep, it actually runs the
>>>> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose
>>>> source file is
>>>> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go.
>>>
>>> Yes, I see that.  That main program starts by rebuilding the dep
>>> program from source, then runs the tests using that copy of the
>>> program, so it's assuming that you're still in a development
>>> environment where you can run a full go build.  That's what I meant by
>>> it not being designed for a cross-build setup.
>>>
>>> I've patched the test program to create a symlink to the installed dep
>>> program instead of rebuilding, and got further.  You'll need to
>>> include 'go', 'git', and 'git-perltools' in the image to get the tests
>>> to run. Some of the test cases failed until I set GOCACHE in the
>>> environment to point to a valid path; I'm not sure why.  The tests
>>> took a long time to run on my qemux86 build, though - at least 30
>>> minutes.
>>
>> Thanks very much for Matt's guide!
>>
>> I have applied the patch you provide to create a symlink to the
>> installed dep program instead of rebuilding and also add go', 'git', and
>> 'git-perltools' into the image, but there is no PASS case, all failed as
>> attached go-dep_ptest.log.
>
> The device under test needs Internet access to fetch repos from
> Github. From the log, it looks like perhaps yours didn't?
>
>>
>> BTW, you said you set GOCACHE, what's the valid path do you mean?
>
> Any directory that the user has write access to.  The default is
> $HOME/.cache/go-build .

There is no difference after set GOCACHE, still all the case failed.

Thanks,

>
> -M
>
>>
>> Thanks,
>>
>>>
>>> Here's the patch I applied to use the already-built dep binary.  An
>>> alternative approach would be to put everything in place to allow the
>>> test program to rebuild the dep binary itself, but that would drive up
>>> the time for the test run even further.
>>>
>>> Regards,
>>> -Matt
>>>
>>> ---
>>>    cmd/dep/dep_test.go | 13 +++++++++----
>>>    1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/src/github.com/golang/dep/cmd/dep/dep_test.go
>>> b/src/github.com/golang/dep/cmd/dep/dep_test.go
>>> index 687eef3a..535ca56d 100644
>>> --- a/src/github.com/golang/dep/cmd/dep/dep_test.go
>>> +++ b/src/github.com/golang/dep/cmd/dep/dep_test.go
>>> @@ -18,13 +18,18 @@ import (
>>>    // deletes it after the tests have been run.
>>>    // Most of this is taken from
>>> https://github.com/golang/go/blob/master/src/cmd/go/go_test.go and
>>> reused here.
>>>    func TestMain(m *testing.M) {
>>> - args := []string{"build", "-o", "testdep" + test.ExeSuffix}
>>> - out, err := exec.Command("go", args...).CombinedOutput()
>>> + args := []string{"dep"}
>>> + out, err := exec.Command("which", args...).CombinedOutput()
>>>     if err != nil {
>>> - fmt.Fprintf(os.Stderr, "building testdep failed: %v\n%s", err, out)
>>> + fmt.Fprintf(os.Stderr, "finding dep failed: %v\n%s", err, out)
>>> + os.Exit(2)
>>> + }
>>> + args = []string{"-s", string(out[:len(out)-1]), "testdep" + test.ExeSuffix}
>>> + out, err = exec.Command("ln", args...).CombinedOutput()
>>> + if err != nil {
>>> + fmt.Fprintf(os.Stderr, "symlinking dep failed: %v\n%s", err, out)
>>>     os.Exit(2)
>>>     }
>>> -
>>>     // Don't let these environment variables confuse the test.
>>>     os.Unsetenv("GOPATH")
>>>     os.Unsetenv("GIT_ALLOW_PROTOCOL")
>>>
>

