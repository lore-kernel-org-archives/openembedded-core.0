Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 54EEA6BDE3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 06:40:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5R6chqs005123
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Jun 2019 23:40:00 -0700
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 26 Jun 2019 23:39:29 -0700
To: Matt Madison <matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
	<20180304210937.29727-7-matt@madison.systems>
	<5D0C9F8B.8060109@windriver.com>
	<CAGgRHJoXVPEq-L9iHniD9mQtvC3CGq3-jP7NincOx1gVqCps3g@mail.gmail.com>
	<5D1335A3.6060508@windriver.com>
	<CAGgRHJozBOK+JH3uFQ-=utkTk97Gqg0N1yH2vdgC8-z6cQwUNA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D1465AA.2050401@windriver.com>
Date: Thu, 27 Jun 2019 14:43:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAGgRHJozBOK+JH3uFQ-=utkTk97Gqg0N1yH2vdgC8-z6cQwUNA@mail.gmail.com>
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
X-List-Received-Date: Thu, 27 Jun 2019 06:40:41 -0000
X-Groupsio-MsgNum: 126283
Content-Type: multipart/mixed; boundary="------------090204020103060006070902"

--------------090204020103060006070902
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年06月26日 22:00, Matt Madison wrote:
> On Wed, Jun 26, 2019 at 2:02 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>>
>>
>> On 2019年06月25日 20:23, Matt Madison wrote:
>>> On Fri, Jun 21, 2019 at 2:08 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>>
>>>> Hi Matt,
>>>>
>>>> I noticed your commit is the latest update for go-dep ptest. But the
>>>> go-dep ptest doesn't work in my environment. I'm trying to figure out
>>>> what's wrong is here though I didn't know much about go.
>>>
>>> I went back over the commits, and I don't think I did anything with
>>> go-dep specifically. I can see that the tests are failing for it, and
>>> it looks like it's because go-dep's test programs make some
>>> assumptions about the environment.  For one thing, it needs the go
>>> compiler installed. It also looks like it's expecting some source
>>> files to be present... in other words, it's not really designed for a
>>> cross-build setup, with tests run on the cross-built target. It could
>>> be messy to work around that, and I'm not sure how useful it would be
>>> anyway, seeing as how go-dep is more of a build tool.  Might be better
>>> to just disable ptests for it completely.
>>
>> Many thanks Matt for your information!
>> Did you ever run go-dep ptest?
>> Go through the run-ptest script for go-dep, it actually runs the
>> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose
>> source file is
>> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go.
>
> Yes, I see that.  That main program starts by rebuilding the dep
> program from source, then runs the tests using that copy of the
> program, so it's assuming that you're still in a development
> environment where you can run a full go build.  That's what I meant by
> it not being designed for a cross-build setup.
>
> I've patched the test program to create a symlink to the installed dep
> program instead of rebuilding, and got further.  You'll need to
> include 'go', 'git', and 'git-perltools' in the image to get the tests
> to run. Some of the test cases failed until I set GOCACHE in the
> environment to point to a valid path; I'm not sure why.  The tests
> took a long time to run on my qemux86 build, though - at least 30
> minutes.

Thanks very much for Matt's guide!

I have applied the patch you provide to create a symlink to the 
installed dep program instead of rebuilding and also add go', 'git', and 
'git-perltools' into the image, but there is no PASS case, all failed as 
attached go-dep_ptest.log.

BTW, you said you set GOCACHE, what's the valid path do you mean?

Thanks,

>
> Here's the patch I applied to use the already-built dep binary.  An
> alternative approach would be to put everything in place to allow the
> test program to rebuild the dep binary itself, but that would drive up
> the time for the test run even further.
>
> Regards,
> -Matt
>
> ---
>   cmd/dep/dep_test.go | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/src/github.com/golang/dep/cmd/dep/dep_test.go
> b/src/github.com/golang/dep/cmd/dep/dep_test.go
> index 687eef3a..535ca56d 100644
> --- a/src/github.com/golang/dep/cmd/dep/dep_test.go
> +++ b/src/github.com/golang/dep/cmd/dep/dep_test.go
> @@ -18,13 +18,18 @@ import (
>   // deletes it after the tests have been run.
>   // Most of this is taken from
> https://github.com/golang/go/blob/master/src/cmd/go/go_test.go and
> reused here.
>   func TestMain(m *testing.M) {
> - args := []string{"build", "-o", "testdep" + test.ExeSuffix}
> - out, err := exec.Command("go", args...).CombinedOutput()
> + args := []string{"dep"}
> + out, err := exec.Command("which", args...).CombinedOutput()
>    if err != nil {
> - fmt.Fprintf(os.Stderr, "building testdep failed: %v\n%s", err, out)
> + fmt.Fprintf(os.Stderr, "finding dep failed: %v\n%s", err, out)
> + os.Exit(2)
> + }
> + args = []string{"-s", string(out[:len(out)-1]), "testdep" + test.ExeSuffix}
> + out, err = exec.Command("ln", args...).CombinedOutput()
> + if err != nil {
> + fmt.Fprintf(os.Stderr, "symlinking dep failed: %v\n%s", err, out)
>    os.Exit(2)
>    }
> -
>    // Don't let these environment variables confuse the test.
>    os.Unsetenv("GOPATH")
>    os.Unsetenv("GIT_ALLOW_PROTOCOL")
>

--------------090204020103060006070902
Content-Type: text/x-log; name="go-dep_ptest.log"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="go-dep_ptest.log"

--- FAIL: TestIntegration (0.46s)
    --- FAIL: TestIntegration/status/revision_constraint (0.00s)
        --- FAIL: TestIntegration/status/revision_constraint/external (0.53s)
            integration_test.go:194: cmd ensure raised an unexpected error: exit status 2
    --- FAIL: TestIntegration/status/override_constraint (0.00s)
        --- FAIL: TestIntegration/status/override_constraint/external (0.52s)
            integration_test.go:194: cmd ensure raised an unexpected error: exit status 2
    --- FAIL: TestIntegration/status/old_constraints (0.00s)
        --- FAIL: TestIntegration/status/old_constraints/external (0.80s)
            integration_test.go:194: cmd ensure raised an unexpected error: exit status 2
    --- FAIL: TestIntegration/status/missing_pkgs_lock_mismatch (0.00s)
        --- FAIL: TestIntegration/status/missing_pkgs_lock_mismatch/external (0.60s)
            integration_test.go:199: exit status 1
            testcase.go:165: error did not contain expected string:
                	(GOT): The following errors occurred while deducing packages:
                  * "github.com/sdboyer/deptestdos": github.com/sdboyer/deptestdos is not a valid path for a source on github.com
                
                validateParams: could not deduce external imports' project roots
                
                	(WNT): is out of sync with imports
    --- FAIL: TestIntegration/status/case1/template (0.00s)
        --- FAIL: TestIntegration/status/case1/template/external (0.59s)
            integration_test.go:194: cmd ensure raised an unexpected error: exit status 2
    --- FAIL: TestIntegration/status/case1/table (0.00s)
        --- FAIL: TestIntegration/status/case1/table/external (0.54s)
            integration_test.go:194: cmd ensure raised an unexpected error: exit status 2
    --- FAIL: TestIntegration/status/case1/json (0.00s)
        --- FAIL: TestIntegration/status/case1/json/external (0.56s)
            integration_test.go:194: cmd ensure raised an unexpected error: exit status 2
    --- FAIL: TestIntegration/status/case1/dot (0.00s)
        --- FAIL: TestIntegration/status/case1/dot/external (0.60s)
            integration_test.go:194: cmd ensure raised an unexpected error: exit status 2
    --- FAIL: TestIntegration/init/vndr/case1 (0.00s)
        --- FAIL: TestIntegration/init/vndr/case1/external (5.66s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/vndr/case1/internal (5.33s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/init/skip-hidden (0.00s)
        --- FAIL: TestIntegration/init/skip-hidden/external (0.54s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x3d pc=0x7f56cc475840]
                
                goroutine 1 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4900, 0xc000446de1, 0x1a, 0x56145830f980, 0xc0003a4900, 0x5614582e4e80)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/gps.githubDeducer.deduceRoot(0xc0003a4900, 0xc000446de1, 0x1a, 0x561458210add, 0xb, 0x56145830f980, 0xc0003a4900)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:115 +0x45
                github.com/golang/dep/gps.(*deductionCoordinator).deduceKnownPaths(0xc00045ae10, 0xc000446de1, 0x1a, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc0003671a0, 0xc0003671b8)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:668 +0x107
                github.com/golang/dep/gps.(*deductionCoordinator).deduceRootPath(0xc00045ae10, 0x561458311f00, 0xc0003280f8, 0xc000446de1, 0x1a, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:608 +0x35b
                github.com/golang/dep/gps.(*SourceMgr).DeduceProjectRoot(0xc0003662a0, 0xc000446de1, 0x1a, 0x561458311f40, 0x0, 0xc0000126c0, 0x1)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/source_manager.go:595 +0xf4
                github.com/golang/dep.(*Project).GetDirectDependencyNames(0xc0003a5200, 0x561458315760, 0xc0003662a0, 0x1, 0xc0003a5200, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/project.go:238 +0xae
                main.(*initCommand).Run(0xc00043373a, 0xc0003a8980, 0xc000324e00, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/init.go:105 +0x15c
                main.(*Config).Run(0xc000366f00, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/init/relative_path (0.00s)
        --- FAIL: TestIntegration/init/relative_path/external (0.50s)
            integration_test.go:199: exit status 1
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                init failed: unable to determine direct dependencies: github.com/sdboyer/deptest is not a valid path for a source on github.com
    --- FAIL: TestIntegration/init/gvt/case1 (0.00s)
        --- FAIL: TestIntegration/init/gvt/case1/external (5.81s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/gvt/case1/internal (7.97s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/init/govendor/case1 (0.00s)
        --- FAIL: TestIntegration/init/govendor/case1/external (8.10s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/govendor/case1/internal (7.69s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/init/govend/case1 (0.00s)
        --- FAIL: TestIntegration/init/govend/case1/external (8.34s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/govend/case1/internal (5.19s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/init/godep/case1 (0.00s)
        --- FAIL: TestIntegration/init/godep/case1/external (5.81s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/godep/case1/internal (5.11s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/init/glock/case1 (0.00s)
        --- FAIL: TestIntegration/init/glock/case1/external (5.51s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/glock/case1/internal (7.87s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/init/glide/trans-trans-unspecified (0.00s)
        --- FAIL: TestIntegration/init/glide/trans-trans-unspecified/external (0.54s)
            integration_test.go:199: exit status 1
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                init failed: unable to determine direct dependencies: github.com/ChinmayR/deptestglideA is not a valid path for a source on github.com
    --- FAIL: TestIntegration/init/glide/trans-trans (0.00s)
        --- FAIL: TestIntegration/init/glide/trans-trans/external (0.81s)
            integration_test.go:199: exit status 1
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                init failed: unable to determine direct dependencies: github.com/ChinmayR/deptestglideA is not a valid path for a source on github.com
    --- FAIL: TestIntegration/init/glide/direct-trans-no-conflict (0.00s)
        --- FAIL: TestIntegration/init/glide/direct-trans-no-conflict/external (0.84s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x20 pc=0x7f07193cb840]
                
                goroutine 1 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4900, 0xc00032ef01, 0x21, 0x55963b61b980, 0xc0003a4900, 0x55963b5f0e80)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/gps.githubDeducer.deduceRoot(0xc0003a4900, 0xc00032ef01, 0x21, 0x55963b51cadd, 0xb, 0x55963b61b980, 0xc0003a4900)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:115 +0x45
                github.com/golang/dep/gps.(*deductionCoordinator).deduceKnownPaths(0xc00045ae10, 0xc00032ef01, 0x21, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000366a80, 0xc000366a98)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:668 +0x107
                github.com/golang/dep/gps.(*deductionCoordinator).deduceRootPath(0xc00045ae10, 0x55963b61df00, 0xc0003280f8, 0xc00032ef01, 0x21, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:608 +0x35b
                github.com/golang/dep/gps.(*SourceMgr).DeduceProjectRoot(0xc000366660, 0xc00032ef01, 0x21, 0x55963b61df40, 0x0, 0xc00000f980, 0x2)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/source_manager.go:595 +0xf4
                github.com/golang/dep.(*Project).GetDirectDependencyNames(0xc0003a43f0, 0x55963b621760, 0xc000366660, 0x1, 0xc0003a43f0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/project.go:238 +0xae
                main.(*initCommand).Run(0xc0004322d2, 0xc0003a8200, 0xc0003244a0, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/init.go:105 +0x15c
                main.(*Config).Run(0xc000366480, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/init/glide/direct-trans-conflict (0.00s)
        --- FAIL: TestIntegration/init/glide/direct-trans-conflict/external (0.55s)
            integration_test.go:199: exit status 1
            testcase.go:165: error did not contain expected string:
                	(GOT): init failed: unable to determine direct dependencies: github.com/ChinmayR/deptestglideA is not a valid path for a source on github.com
                
                	(WNT): master: Could not introduce github.com/ChinmayR/deptestglideA@master, as it is not allowed by constraint ^0.1.0 from project github.com/golang/notexist.
    --- FAIL: TestIntegration/init/glide/corrupt-glide (0.00s)
        --- FAIL: TestIntegration/init/glide/corrupt-glide/external (0.52s)
            integration_test.go:199: exit status 1
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                init failed: unable to determine direct dependencies: github.com/ChinmayR/deptestglideA is not a valid path for a source on github.com
    --- FAIL: TestIntegration/init/glide/case4 (0.00s)
        --- FAIL: TestIntegration/init/glide/case4/external (5.48s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/glide/case4/internal (5.42s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/init/glide/case3 (0.00s)
        --- FAIL: TestIntegration/init/glide/case3/external (0.55s)
            integration_test.go:199: exit status 1
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                init failed: unable to determine direct dependencies: github.com/carolynvs/deptestglide is not a valid path for a source on github.com
    --- FAIL: TestIntegration/init/glide/case2 (0.00s)
        --- FAIL: TestIntegration/init/glide/case2/external (5.33s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/glide/case2/internal (5.24s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/init/glide/case1 (0.00s)
        --- FAIL: TestIntegration/init/glide/case1/external (5.46s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/glide/case1/internal (5.22s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/init/case4 (0.00s)
        --- FAIL: TestIntegration/init/case4/external (10.57s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptestdos] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/case4/internal (10.06s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptestdos] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/init/case3 (0.00s)
        --- FAIL: TestIntegration/init/case3/external (9.79s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptestdos] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/case3/internal (10.28s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptestdos] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/init/case2 (0.00s)
        --- FAIL: TestIntegration/init/case2/external (5.32s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/case2/internal (5.19s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/init/case1 (0.00s)
        --- FAIL: TestIntegration/init/case1/external (5.72s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
        --- FAIL: TestIntegration/init/case1/internal (5.09s)
            testproj.go:119: go standard error:
            testproj.go:120: build cache is disabled by GOCACHE=off, but required as of Go 1.12
                
            testproj.go:123: go [get github.com/sdboyer/deptest] failed unexpectedly: exit status 1
    --- FAIL: TestIntegration/ensure/update/novendor (0.00s)
        --- FAIL: TestIntegration/ensure/update/novendor/external (0.53s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432648, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432648, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4120, 0xc000432648, 0x5, 0xc000464500, 0x7fd7c111d760, 0xc000012700)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc000432648, 0x5, 0x1, 0xc0000131f0, 0x0, 0x0, 0xc0000131e0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc000432648, 0x5, 0x7fd7c064f301, 0xc000214600, 0x10, 0x10, 0x7fd7c111d760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc000432648, 0x5, 0x203000, 0xc0000131a0, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc000446f00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc000432648, 0x5, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc000324230, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x55614d400c20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7fd7c06756ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8980, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc000433740, 0xc0003a8980, 0xc000324e00, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc000366f00, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/ensure/update/errs/spec-with-source (0.00s)
        --- FAIL: TestIntegration/ensure/update/errs/spec-with-source/external (0.53s)
            integration_test.go:199: exit status 2
            testcase.go:165: error did not contain expected string:
                	(GOT): panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432638, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432638, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4120, 0xc000432638, 0x5, 0xc000466500, 0x7f3c0692c760, 0xc000012700)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc000432638, 0x5, 0x1, 0xc0000131f0, 0x0, 0x0, 0xc0000131e0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc000432638, 0x5, 0x7f3c05e5e301, 0xc000214600, 0x10, 0x10, 0x7f3c0692c760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc000432638, 0x5, 0x203000, 0xc0000131a0, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc000446f00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc000432638, 0x5, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc000324230, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x55ca00adec20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7f3c05e846ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8980, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc000433740, 0xc0003a8980, 0xc000324e00, 0x1, 0x1, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc000366f00, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
                
                	(WNT): version constraint ^1.0.0 passed for github.com/sdboyer/deptest, but -update follows constraints declared in
    --- FAIL: TestIntegration/ensure/update/errs/spec-with-constraint (0.00s)
        --- FAIL: TestIntegration/ensure/update/errs/spec-with-constraint/external (1.06s)
            integration_test.go:199: exit status 1
            testcase.go:165: error did not contain expected string:
                	(GOT): The following issues were found in Gopkg.toml:
                
                  ✗ github.com/sdboyer/deptest is not a valid path for a source on github.com
                
                ProjectRoot name validation failed
                
                	(WNT): cannot specify alternate sources on -update (github.com/other/deptest)
    --- FAIL: TestIntegration/ensure/update/errs/not-in-lock (0.00s)
        --- FAIL: TestIntegration/ensure/update/errs/not-in-lock/external (1.19s)
            integration_test.go:199: exit status 2
            testcase.go:165: error did not contain expected string:
                	(GOT): panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003ac120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc00043c668, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003ac120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc00043c668, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003ac120, 0xc00043c668, 0x5, 0xc000464500, 0x7f5003c15760, 0xc0000130e0)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc00043c668, 0x5, 0x1, 0xc000013330, 0x0, 0x0, 0xc000013320)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc00043c668, 0x5, 0x7f5003147301, 0xc000214600, 0x10, 0x10, 0x7f5003c15760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc00043c668, 0x5, 0x203000, 0xc0000132e0, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc00044ef00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc00043c668, 0x5, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc000324280, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x5609125c1c20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7f500316d6ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003b0000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc00043d740, 0xc0003b0000, 0xc000324e00, 0x1, 0x1, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc000366f00, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
                
                	(WNT): github.com/sdboyer/deptesttres is not present in Gopkg.lock, cannot -update it
    --- FAIL: TestIntegration/ensure/update/errs/nonroot-arg (0.00s)
        --- FAIL: TestIntegration/ensure/update/errs/nonroot-arg/external (1.14s)
            integration_test.go:199: exit status 2
            testcase.go:165: error did not contain expected string:
                	(GOT): panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4240, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc0004328d8, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4240, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc0004328d8, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc0004328d8, 0x5, 0x5, 0x7f2b6e616460, 0xc000013400)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc0004328d8, 0x5, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.toProject(0xc000446f00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc0004328d8, 0x5, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:512 +0x2d6
                github.com/golang/dep.fromRawManifest(0xc0003245f0, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x55e107176c20, 0xc000212010, 0xc000212010, 0xc000000000, 0xc000212010, 0x0, 0x0, 0x7f2b6ca2a6ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8080, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc000432256, 0xc0003a8080, 0xc0003243b0, 0x1, 0x1, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc0003662a0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
                
                	(WNT): github.com/sdboyer/deptest/subpkg is not a project root, try github.com/sdboyer/deptest instead
    --- FAIL: TestIntegration/ensure/update/errs/lockless (0.00s)
        --- FAIL: TestIntegration/ensure/update/errs/lockless/external (1.11s)
            integration_test.go:199: exit status 2
            testcase.go:165: error did not contain expected string:
                	(GOT): panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432688, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432688, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4120, 0xc000432688, 0x5, 0xc000464500, 0x7f7874b9f760, 0x7f7873302248)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc000432688, 0x5, 0x1, 0xc000013380, 0x0, 0x0, 0xc000013370)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc000432688, 0x5, 0x7f78740d1301, 0xc000214600, 0x10, 0x10, 0x7f7874b9f760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc000432688, 0x5, 0x203000, 0xc000013330, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc000446f00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc000432688, 0x5, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc000382320, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x55cb5be8cc20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7f78740f76ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc000432006, 0xc0003a8000, 0xc0003243f0, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc0003641e0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
                
                	(WNT): -update works by updating the versions recorded in Gopkg.lock, but Gopkg.lock does not exist
    --- FAIL: TestIntegration/ensure/update/desync (0.00s)
        --- FAIL: TestIntegration/ensure/update/desync/external (1.19s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc0004326a0, 0x6, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc0004326a0, 0x6, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4120, 0xc0004326a0, 0x6, 0xc000466500, 0x7f36c7c56760, 0x7f36c63b9248)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc0004326a0, 0x6, 0x1, 0xc000013360, 0x0, 0x0, 0xc000013350)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc0004326a0, 0x6, 0x7f36c7188301, 0xc000214600, 0x10, 0x10, 0x7f36c7c56760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc0004326a0, 0x6, 0x203000, 0xc000013310, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc00044ef00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc0004326a0, 0x6, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc0003822d0, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x5600aa9e9c20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7f36c71ae6ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc000432006, 0xc0003a8000, 0xc000324130, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc0003641e0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/ensure/update/case1 (0.00s)
        --- FAIL: TestIntegration/ensure/update/case1/external (1.11s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432680, 0x6, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432680, 0x6, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4120, 0xc000432680, 0x6, 0xc00046e500, 0x7fab13ab3760, 0xc0000130f0)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc000432680, 0x6, 0x1, 0xc000013340, 0x0, 0x0, 0xc000013330)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc000432680, 0x6, 0x7fab12fe5301, 0xc000214600, 0x10, 0x10, 0x7fab13ab3760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc000432680, 0x6, 0x203000, 0xc0000132f0, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc00044ef00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc000432680, 0x6, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc000324280, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x55da1d474c20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7fab1300b6ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc000433740, 0xc0003a8000, 0xc000324e00, 0x1, 0x1, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc000366f00, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/ensure/pkg-ignored/wildcard-ignore (0.00s)
        --- FAIL: TestIntegration/ensure/pkg-ignored/wildcard-ignore/external (1.06s)
            integration_test.go:199: exit status 1
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                The following issues were found in Gopkg.toml:
                
                  ✗ github.com/sdboyer/deptest is not a valid path for a source on github.com
                
                ProjectRoot name validation failed
    --- FAIL: TestIntegration/ensure/noverify/hash_mismatch (0.00s)
        --- FAIL: TestIntegration/ensure/noverify/hash_mismatch/external (1.00s)
            integration_test.go:194: cmd ensure raised an unexpected error: exit status 2
    --- FAIL: TestIntegration/ensure/empty/case3 (0.00s)
        --- FAIL: TestIntegration/ensure/empty/case3/external (1.07s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: makeslice: len out of range
                
                goroutine 9 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4900, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc00044f240, 0x1a, 0x0, 0x75687469676874, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4900, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc00044f240, 0x1a, 0x0, 0x75687469676874, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4900, 0xc00044f240, 0x1a, 0x55bd229b4980, 0xc0003a4900, 0x55bd22989e80)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/gps.githubDeducer.deduceRoot(0xc0003a4900, 0xc00044f240, 0x1a, 0x55bd228b5add, 0xb, 0x55bd229b4980, 0xc0003a4900)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:115 +0x45
                github.com/golang/dep/gps.(*deductionCoordinator).deduceKnownPaths(0xc000461b00, 0xc00044f240, 0x1a, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000365320, 0xc000365338)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:668 +0x107
                github.com/golang/dep/gps.(*deductionCoordinator).deduceRootPath(0xc000461b00, 0x55bd229b6f00, 0xc0003260f8, 0xc00044f240, 0x1a, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:608 +0x35b
                github.com/golang/dep/gps.(*SourceMgr).DeduceProjectRoot(0xc000365080, 0xc00044f240, 0x1a, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/source_manager.go:595 +0xf4
                github.com/golang/dep.ValidateProjectRoots.func1(0xc00044f240, 0x1a)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:306 +0xab
                created by github.com/golang/dep.ValidateProjectRoots
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:316 +0x1b2
    --- FAIL: TestIntegration/ensure/empty/case2 (0.00s)
        --- FAIL: TestIntegration/ensure/empty/case2/external (0.95s)
            integration_test.go:199: exit status 1
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                The following issues were found in Gopkg.toml:
                
                  ✗ github.com/sdboyer/deptest is not a valid path for a source on github.com
                
                ProjectRoot name validation failed
    --- FAIL: TestIntegration/ensure/empty/case1 (0.00s)
        --- FAIL: TestIntegration/ensure/empty/case1/external (0.59s)
            integration_test.go:194: cmd init raised an unexpected error: exit status 1
    --- FAIL: TestIntegration/ensure/default/nocode-vendoronly (0.00s)
        --- FAIL: TestIntegration/ensure/default/nocode-vendoronly/external (0.69s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x20 pc=0x7f617e2f6840]
                
                goroutine 9 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4900, 0xc000446f00, 0x1a, 0x55ff1442a980, 0xc0003a4900, 0x55ff143ffe80)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/gps.githubDeducer.deduceRoot(0xc0003a4900, 0xc000446f00, 0x1a, 0x55ff1432badd, 0xb, 0x55ff1442a980, 0xc0003a4900)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:115 +0x45
                github.com/golang/dep/gps.(*deductionCoordinator).deduceKnownPaths(0xc00045b560, 0xc000446f00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000365080, 0xc000365098)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:668 +0x107
                github.com/golang/dep/gps.(*deductionCoordinator).deduceRootPath(0xc00045b560, 0x55ff1442cf00, 0xc0003280f8, 0xc000446f00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:608 +0x35b
                github.com/golang/dep/gps.(*SourceMgr).DeduceProjectRoot(0xc000364de0, 0xc000446f00, 0x1a, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/source_manager.go:595 +0xf4
                github.com/golang/dep.ValidateProjectRoots.func1(0xc000446f00, 0x1a)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:306 +0xab
                created by github.com/golang/dep.ValidateProjectRoots
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:316 +0x1b2
    --- FAIL: TestIntegration/ensure/default/hashneq-vendoronly (0.00s)
        --- FAIL: TestIntegration/ensure/default/hashneq-vendoronly/external (0.54s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432648, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432648, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4120, 0xc000432648, 0x5, 0xc000464500, 0x7f05217ee760, 0xc000012700)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc000432648, 0x5, 0x1, 0xc0000131f0, 0x0, 0x0, 0xc0000131e0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc000432648, 0x5, 0x7f0520d20301, 0xc000214600, 0x10, 0x10, 0x7f05217ee760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc000432648, 0x5, 0x203000, 0xc0000131a0, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc000446f00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc000432648, 0x5, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc000382190, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x559c3c964c20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7f0520d466ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8980, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc000433740, 0xc0003a8980, 0xc000325670, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc000364f00, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/ensure/default/hasheq-novendor-dry (0.00s)
        --- FAIL: TestIntegration/ensure/default/hasheq-novendor-dry/external (0.53s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432688, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432688, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4120, 0xc000432688, 0x5, 0xc000464500, 0x7f8b6f4b4760, 0x7f8b6dc17248)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc000432688, 0x5, 0x1, 0xc000013380, 0x0, 0x0, 0xc000013370)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc000432688, 0x5, 0x7f8b6e9e6301, 0xc000214600, 0x10, 0x10, 0x7f8b6f4b4760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc000432688, 0x5, 0x203000, 0xc000013330, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc000446f00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc000432688, 0x5, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc000324410, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x564c359b5c20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7f8b6ea0c6ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc000432006, 0xc0003a8000, 0xc0003241d0, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc0003661e0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/ensure/default/hasheq-novendor (0.00s)
        --- FAIL: TestIntegration/ensure/default/hasheq-novendor/external (0.54s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003ac120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc00043c688, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003ac120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc00043c688, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003ac120, 0xc00043c688, 0x5, 0xc000464500, 0x7f24c7f17760, 0x7f24c667a248)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc00043c688, 0x5, 0x1, 0xc000013380, 0x0, 0x0, 0xc000013370)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc00043c688, 0x5, 0x7f24c7449301, 0xc000214600, 0x10, 0x10, 0x7f24c7f17760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc00043c688, 0x5, 0x203000, 0xc000013330, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc00044ef00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc00043c688, 0x5, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc00038a2d0, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x55974a8f4c20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7f24c746f6ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003b0000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc00043c006, 0xc0003b0000, 0xc000324370, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc0003641e0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/ensure/default/hasheq-dry (0.00s)
        --- FAIL: TestIntegration/ensure/default/hasheq-dry/external (0.56s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x20 pc=0x7f34c05bf840]
                
                goroutine 1 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc000432ac0, 0x6, 0x6, 0x7f34c1cce460, 0x7f34c01dca00)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc000432ac0, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.fromRawLock(0xc000432ba2, 0x3, 0x1, 0xc000433a28, 0x8, 0x1, 0x0, 0x0, 0x0, 0xc0003a4240, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:96 +0x2a3
                github.com/golang/dep.readLock(0x56153803ec20, 0xc000212078, 0xc000212078, 0xc000000000, 0xc000212078)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:74 +0x1d2
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8980, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:189 +0x517
                main.(*ensureCommand).Run(0xc000433740, 0xc0003a8980, 0xc000325670, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc000364f00, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/ensure/default/hasheq (0.00s)
        --- FAIL: TestIntegration/ensure/default/hasheq/external (0.53s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432678, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432678, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4120, 0xc000432678, 0x5, 0xc000464500, 0x7f076b5f0760, 0x7f0769d53248)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc000432678, 0x5, 0x1, 0xc000013380, 0x0, 0x0, 0xc000013370)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc000432678, 0x5, 0x7f076ab22301, 0xc000214660, 0x10, 0x10, 0x7f076b5f0760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc000432678, 0x5, 0x203000, 0xc000013330, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc000446f00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc000432678, 0x5, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc0003822d0, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x556e07693c20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7f076ab486ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc000432004, 0xc0003a8000, 0xc000458680, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc0003641e0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/ensure/default/errs/specargs (0.00s)
        --- FAIL: TestIntegration/ensure/default/errs/specargs/external (0.61s)
            integration_test.go:199: exit status 2
            testcase.go:165: error did not contain expected string:
                	(GOT): panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc0004326a8, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc0004326a8, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4120, 0xc0004326a8, 0x5, 0xc00046e500, 0x7fbf4b8d8760, 0x7fbf4a03b248)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc0004326a8, 0x5, 0x1, 0xc000013390, 0x0, 0x0, 0xc000013380)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc0004326a8, 0x5, 0x7fbf4ae0a301, 0xc000214600, 0x10, 0x10, 0x7fbf4b8d8760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc0004326a8, 0x5, 0x203000, 0xc000013340, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc00044ef00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc0004326a8, 0x5, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc0003823c0, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x5575d0ee1c20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7fbf4ae306ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc000432026, 0xc0003a8000, 0xc0003243f0, 0x1, 0x1, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc0003641e0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
                
                	(WNT): dep ensure only takes spec arguments with -add or -update
    --- FAIL: TestIntegration/ensure/default/errs/lockless-vendoronly (0.00s)
        --- FAIL: TestIntegration/ensure/default/errs/lockless-vendoronly/external (0.57s)
            integration_test.go:199: exit status 2
            testcase.go:165: error did not contain expected string:
                	(GOT): panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a6120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432688, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a6120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432688, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a6120, 0xc000432688, 0x5, 0xc000466500, 0x7f3adb8a2760, 0x7f3ada005248)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc000432688, 0x5, 0x1, 0xc000013380, 0x0, 0x0, 0xc000013370)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc000432688, 0x5, 0x7f3adadd4301, 0xc000214600, 0x10, 0x10, 0x7f3adb8a2760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc000432688, 0x5, 0x203000, 0xc000013330, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc000446f00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc000432688, 0x5, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc000382320, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x56056fbedc20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7f3adadfa6ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003aa000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc000432006, 0xc0003aa000, 0xc0003243f0, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc0003641e0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
                
                	(WNT): no Gopkg.lock exists from which to populate vendor/
    --- FAIL: TestIntegration/ensure/add/exists-manifest-constraint (0.00s)
        --- FAIL: TestIntegration/ensure/add/exists-manifest-constraint/external (0.51s)
            integration_test.go:199: exit status 1
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                The following issues were found in Gopkg.toml:
                
                  ✗ github.com/sdboyer/deptest is not a valid path for a source on github.com
                  ✗ github.com/sdboyer/deptesttres is not a valid path for a source on github.com
                
                ProjectRoot name validation failed
    --- FAIL: TestIntegration/ensure/add/errs/self-add/case2 (0.00s)
        --- FAIL: TestIntegration/ensure/add/errs/self-add/case2/external (1.05s)
            integration_test.go:199: exit status 1
            testcase.go:165: error did not contain expected string:
                	(GOT): (1/1) github.com/golang/notexist
                
                Failed to add the dependencies:
                
                  ✗ could not infer project root from dependency path: github.com/golang/notexist: github.com/golang/notexist is not a valid path for a source on github.com
                
                adding dependencies failed
                
                	(WNT): cannot add current project to itself
    --- FAIL: TestIntegration/ensure/add/errs/self-add/case1 (0.00s)
        --- FAIL: TestIntegration/ensure/add/errs/self-add/case1/external (0.56s)
            integration_test.go:199: exit status 2
            testcase.go:165: error did not contain expected string:
                	(GOT): panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432638, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4120, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000432638, 0x5, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4120, 0xc000432638, 0x5, 0xc000464500, 0x7f29fc712760, 0xc000012700)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.parseConstraint(0xc000432638, 0x5, 0x1, 0xc0000131f0, 0x0, 0x0, 0xc0000131e0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/parse.go:24 +0x61
                github.com/golang/dep/vendor/github.com/Masterminds/semver.newConstraint(0xc000432638, 0x5, 0x7f29fbc44301, 0xc000214600, 0x10, 0x10, 0x7f29fc712760, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:145 +0x3ff
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewConstraintIC(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/constraints.go:123
                github.com/golang/dep/gps.NewSemverConstraintIC(0xc000432638, 0x5, 0x203000, 0xc0000131a0, 0x1, 0x203000)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/constraint.go:136 +0x67
                github.com/golang/dep.toProject(0xc000446f00, 0x1a, 0x0, 0x0, 0x0, 0x0, 0xc000432638, 0x5, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:509 +0x274
                github.com/golang/dep.fromRawManifest(0xc000324230, 0x1, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:381 +0x288
                github.com/golang/dep.readManifest(0x55b80681ac20, 0xc000212000, 0xc000212000, 0xc000000000, 0xc000212000, 0x0, 0x0, 0x7f29fbc6a6ef)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:362 +0x262
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8980, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:170 +0x293
                main.(*ensureCommand).Run(0xc000433740, 0xc0003a8980, 0xc000324e00, 0x1, 0x1, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc000366f00, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
                
                	(WNT): cannot add current project to itself
    --- FAIL: TestIntegration/ensure/add/errs/noarg (0.00s)
        --- FAIL: TestIntegration/ensure/add/errs/noarg/external (0.53s)
            integration_test.go:199: exit status 2
            testcase.go:165: error did not contain expected string:
                	(GOT): panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x20 pc=0x7fbdec11c840]
                
                goroutine 1 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc00043c830, 0x6, 0x6, 0x7fbded82b460, 0x7fbdebd39a00)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc00043c830, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.fromRawLock(0xc00043da02, 0x3, 0x1, 0xc00043dc58, 0x8, 0x1, 0x0, 0x0, 0x0, 0xc0003d7440, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:96 +0x2a3
                github.com/golang/dep.readLock(0x55efc56dfc20, 0xc000212070, 0xc000212070, 0xc000000000, 0xc000212070)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:74 +0x1d2
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8980, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:189 +0x517
                main.(*ensureCommand).Run(0xc00043d740, 0xc0003a8980, 0xc000325670, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc000364f00, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
                
                	(WNT): must specify at least one project or package to -add
    --- FAIL: TestIntegration/ensure/add/errs/exists-manifest (0.00s)
        --- FAIL: TestIntegration/ensure/add/errs/exists-manifest/external (0.57s)
            integration_test.go:199: exit status 1
            testcase.go:165: error did not contain expected string:
                	(GOT): The following issues were found in Gopkg.toml:
                
                  ✗ github.com/sdboyer/deptest is not a valid path for a source on github.com
                  ✗ github.com/sdboyer/deptesttres is not a valid path for a source on github.com
                
                ProjectRoot name validation failed
                
                	(WNT): Gopkg.toml already contains rules for github.com/sdboyer/deptest, cannot specify a version constraint
    --- FAIL: TestIntegration/ensure/add/errs/exists (0.00s)
        --- FAIL: TestIntegration/ensure/add/errs/exists/external (0.53s)
            integration_test.go:199: exit status 2
            testcase.go:165: error did not contain expected string:
                	(GOT): panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x20 pc=0x7fe73a4bf840]
                
                goroutine 1 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc00043c920, 0x6, 0x6, 0x7fe73bbce460, 0x7fe73a0dca00)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc00043c920, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.fromRawLock(0xc00043c9c2, 0x3, 0x1, 0xc00043da38, 0x8, 0x1, 0x0, 0x0, 0x0, 0xc0003a4240, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:96 +0x2a3
                github.com/golang/dep.readLock(0x55e711782c20, 0xc000212070, 0xc000212070, 0xc000000000, 0xc000212070)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:74 +0x1d2
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8980, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:189 +0x517
                main.(*ensureCommand).Run(0xc00043d740, 0xc0003a8980, 0xc000324e00, 0x1, 0x1, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/ensure.go:162 +0x7d
                main.(*Config).Run(0xc000366f00, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
                
                	(WNT): nothing to -add, github.com/sdboyer/deptest is already in Gopkg.toml and the project's direct imports or required list
    --- FAIL: TestIntegration/ensure/add/errs/double-diff-spec (0.00s)
        --- FAIL: TestIntegration/ensure/add/errs/double-diff-spec/external (0.53s)
            integration_test.go:194: cmd init raised an unexpected error: exit status 2
    --- FAIL: TestIntegration/ensure/add/desync (0.00s)
        --- FAIL: TestIntegration/ensure/add/desync/external (0.52s)
            integration_test.go:199: exit status 1
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                The following issues were found in Gopkg.toml:
                
                  ✗ github.com/sdboyer/deptest is not a valid path for a source on github.com
                
                ProjectRoot name validation failed
    --- FAIL: TestIntegration/ensure/add/all-new-spec (0.00s)
        --- FAIL: TestIntegration/ensure/add/all-new-spec/external (0.52s)
            integration_test.go:194: cmd init raised an unexpected error: exit status 1
    --- FAIL: TestIntegration/ensure/add/all-new-double-spec (0.00s)
        --- FAIL: TestIntegration/ensure/add/all-new-double-spec/external (10.86s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x20 pc=0x7f92a5123840]
                
                goroutine 9 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4900, 0xc000447000, 0x1e, 0x56192f902980, 0xc0003a4900, 0x56192f8d7e80)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/gps.githubDeducer.deduceRoot(0xc0003a4900, 0xc000447000, 0x1e, 0x56192f803add, 0xb, 0x56192f902980, 0xc0003a4900)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:115 +0x45
                github.com/golang/dep/gps.(*deductionCoordinator).deduceKnownPaths(0xc00045b890, 0xc000447000, 0x1e, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000325260, 0xc000325278)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:668 +0x107
                github.com/golang/dep/gps.(*deductionCoordinator).deduceRootPath(0xc00045b890, 0x56192f904f00, 0xc0003280f8, 0xc000447000, 0x1e, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/deduce.go:608 +0x35b
                github.com/golang/dep/gps.(*SourceMgr).DeduceProjectRoot(0xc000324fc0, 0xc000447000, 0x1e, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/source_manager.go:595 +0xf4
                github.com/golang/dep.ValidateProjectRoots.func1(0xc000447000, 0x1e)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:306 +0xab
                created by github.com/golang/dep.ValidateProjectRoots
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/manifest.go:316 +0x1b2
    --- FAIL: TestIntegration/ensure/add/all-new-double (0.00s)
        --- FAIL: TestIntegration/ensure/add/all-new-double/external (0.52s)
            integration_test.go:194: cmd init raised an unexpected error: exit status 1
    --- FAIL: TestIntegration/ensure/add/all-new (0.00s)
        --- FAIL: TestIntegration/ensure/add/all-new/external (1.15s)
            integration_test.go:194: cmd init raised an unexpected error: exit status 1
    --- FAIL: TestIntegration/check/vendororphans (0.00s)
        --- FAIL: TestIntegration/check/vendororphans/external (0.57s)
            integration_test.go:199: exit status 2
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x20 pc=0x7fae71d4b840]
                
                goroutine 1 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc0004328a0, 0x6, 0x6, 0x7fae7345a460, 0x7fae71968a00)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc0004328a0, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.fromRawLock(0xc000432942, 0x3, 0x1, 0xc0004337d8, 0x8, 0x1, 0xc0000137a0, 0x1, 0x1, 0xc0003a4240, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:96 +0x2a3
                github.com/golang/dep.readLock(0x5604f5176c20, 0xc000212060, 0xc000212060, 0xc000000000, 0xc000212060)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:74 +0x1d2
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8980, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:189 +0x517
                main.(*checkCommand).Run(0xc000433746, 0xc0003a8980, 0xc00000f800, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/check.go:67 +0x6d
                main.(*Config).Run(0xc000364f60, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/check/unmet_override (0.00s)
        --- FAIL: TestIntegration/check/unmet_override/external (1.11s)
            integration_test.go:199: exit status 2
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4240, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000433840, 0x6, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4240, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000433840, 0x6, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc000433840, 0x6, 0x6, 0x7f6048804460, 0x7f6046d12a00)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc000433840, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.fromRawLock(0xc0004338e2, 0x3, 0x1, 0xc000433b68, 0x8, 0x1, 0xc0003cc350, 0x1, 0x1, 0xc0003a43f0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:96 +0x2a3
                github.com/golang/dep.readLock(0x55e2415ebc20, 0xc000212088, 0xc000212088, 0xc000000000, 0xc000212088)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:74 +0x1d2
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8080, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:189 +0x517
                main.(*checkCommand).Run(0xc00043225c, 0xc0003a8080, 0xc00000e800, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/check.go:67 +0x6d
                main.(*Config).Run(0xc0003642a0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/check/unmet_constraint (0.00s)
        --- FAIL: TestIntegration/check/unmet_constraint/external (1.13s)
            integration_test.go:199: exit status 2
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x3a pc=0x7f811accf840]
                
                goroutine 1 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc00043d830, 0x6, 0x6, 0x7f811c3de460, 0x7f811a8eca00)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc00043d830, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.fromRawLock(0xc00043d8d2, 0x3, 0x1, 0xc00043db58, 0x8, 0x1, 0xc000436350, 0x1, 0x1, 0xc0003a42d0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:96 +0x2a3
                github.com/golang/dep.readLock(0x56079f563c20, 0xc000212078, 0xc000212078, 0xc000000000, 0xc000212078)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:74 +0x1d2
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:189 +0x517
                main.(*checkCommand).Run(0xc00043c00a, 0xc0003a8000, 0xc00000e020, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/check.go:67 +0x6d
                main.(*Config).Run(0xc0003641e0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/check/noverify/vendororphans (0.00s)
        --- FAIL: TestIntegration/check/noverify/vendororphans/external (0.91s)
            integration_test.go:199: exit status 2
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x3a pc=0x7f0deda3e840]
                
                goroutine 1 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc000433750, 0x6, 0x6, 0x7f0def14d460, 0x7f0ded65ba00)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc000433750, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.fromRawLock(0xc0004337f2, 0x3, 0x1, 0xc000433a78, 0x8, 0x1, 0xc00044a070, 0x1, 0x1, 0xc0003a42d0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:96 +0x2a3
                github.com/golang/dep.readLock(0x55dbb8f27c20, 0xc000212060, 0xc000212060, 0xc000000000, 0xc000212060)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:74 +0x1d2
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:189 +0x517
                main.(*checkCommand).Run(0xc00043200a, 0xc0003a8000, 0xc00000e020, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/check.go:67 +0x6d
                main.(*Config).Run(0xc0003641e0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/check/noverify/unmet_override (0.00s)
        --- FAIL: TestIntegration/check/noverify/unmet_override/external (0.86s)
            integration_test.go:199: exit status 2
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4240, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000433ac0, 0x6, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4240, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000433ac0, 0x6, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc000433ac0, 0x6, 0x6, 0x7fc38b4da460, 0x7fc3899e8a00)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc000433ac0, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.fromRawLock(0xc000433b62, 0x3, 0x1, 0xc000433de8, 0x8, 0x1, 0xc000434660, 0x1, 0x1, 0xc0003a43f0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:96 +0x2a3
                github.com/golang/dep.readLock(0x5577c6ef0c20, 0xc000212088, 0xc000212088, 0xc000000000, 0xc000212088)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:74 +0x1d2
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8080, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:189 +0x517
                main.(*checkCommand).Run(0xc00043225c, 0xc0003a8080, 0xc00000e8a0, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/check.go:67 +0x6d
                main.(*Config).Run(0xc0003642a0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/check/noverify/unmet_constraint (0.00s)
        --- FAIL: TestIntegration/check/noverify/unmet_constraint/external (0.89s)
            integration_test.go:199: exit status 2
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: makeslice: len out of range
                
                goroutine 1 [running]:
                regexp.(*Regexp).doOnePass(0xc0003a4240, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000433ac0, 0x6, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:405 +0x9a8
                regexp.(*Regexp).doExecute(0xc0003a4240, 0x0, 0x0, 0x0, 0x0, 0x0, 0xc000433ac0, 0x6, 0x0, 0x616c6f672f6d6f63, ...)
                	/usr/lib64/go/src/regexp/exec.go:528 +0x51d
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc000433ac0, 0x6, 0x6, 0x7f9eb56ff460, 0x7f9eb3c0da00)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0xb7
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc000433ac0, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.fromRawLock(0xc000433b62, 0x3, 0x1, 0xc000433de8, 0x8, 0x1, 0xc0003cc650, 0x1, 0x1, 0xc0003a43f0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:96 +0x2a3
                github.com/golang/dep.readLock(0x55df8ffa6c20, 0xc000212080, 0xc000212080, 0xc000000000, 0xc000212080)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:74 +0x1d2
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8080, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:189 +0x517
                main.(*checkCommand).Run(0xc00043212c, 0xc0003a8080, 0xc00000e2e0, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/check.go:67 +0x6d
                main.(*Config).Run(0xc000364240, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/check/noverify/hash_version_mismatch (0.00s)
        --- FAIL: TestIntegration/check/noverify/hash_version_mismatch/external (0.82s)
            integration_test.go:199: exit status 2
            testcase.go:187: expected command not to fail, but it did
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x3a pc=0x7f6c22597840]
                
                goroutine 1 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc000433750, 0x6, 0x6, 0x7f6c23ca6460, 0x7f6c221b4a00)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc000433750, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.fromRawLock(0xc0004337f2, 0x3, 0x1, 0xc000433a78, 0x8, 0x1, 0xc000442060, 0x1, 0x1, 0xc0003a42d0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:96 +0x2a3
                github.com/golang/dep.readLock(0x55b91a38fc20, 0xc000212060, 0xc000212060, 0xc000000000, 0xc000212060)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:74 +0x1d2
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:189 +0x517
                main.(*checkCommand).Run(0xc00043200c, 0xc0003a8000, 0xc00000e260, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/check.go:67 +0x6d
                main.(*Config).Run(0xc0003641e0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/check/hash_version_mismatch (0.00s)
        --- FAIL: TestIntegration/check/hash_version_mismatch/external (0.67s)
            integration_test.go:199: exit status 2
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x3a pc=0x7fd7cae2b840]
                
                goroutine 1 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc0004328f0, 0x6, 0x6, 0x7fd7cc53a460, 0x7fd7caa48a00)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc0004328f0, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.fromRawLock(0xc000432992, 0x3, 0x1, 0xc0004337d8, 0x8, 0x1, 0xc000013870, 0x1, 0x1, 0xc0003a42d0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:96 +0x2a3
                github.com/golang/dep.readLock(0x55be4a286c20, 0xc000212060, 0xc000212060, 0xc000000000, 0xc000212060)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:74 +0x1d2
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:189 +0x517
                main.(*checkCommand).Run(0xc00043200c, 0xc0003a8000, 0xc00000e1a0, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/check.go:67 +0x6d
                main.(*Config).Run(0xc0003641e0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
    --- FAIL: TestIntegration/check/hash_mismatch (0.00s)
        --- FAIL: TestIntegration/check/hash_mismatch/external (0.62s)
            integration_test.go:199: exit status 2
            testcase.go:171: error raised where none was expected: 
                panic: runtime error: invalid memory address or nil pointer dereference
                [signal SIGSEGV: segmentation violation code=0x1 addr=0x3a pc=0x7fad77912840]
                
                goroutine 1 [running]:
                regexp.(*Regexp).FindStringSubmatch(0xc0003a4240, 0xc0004328d0, 0x6, 0x6, 0x7fad79021460, 0x7fad7752fa00)
                	/usr/lib64/go/src/regexp/regexp.go:982 +0x50
                github.com/golang/dep/vendor/github.com/Masterminds/semver.NewVersion(0xc0004328d0, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/vendor/github.com/Masterminds/semver/version.go:81 +0x165
                github.com/golang/dep/gps.NewVersion(...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/gps/version.go:107
                github.com/golang/dep.fromRawLock(0xc000432972, 0x3, 0x1, 0xc0004337d8, 0x8, 0x1, 0xc0000137b0, 0x1, 0x1, 0xc0003a42d0, ...)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:96 +0x2a3
                github.com/golang/dep.readLock(0x55c5ba926c20, 0xc000212060, 0xc000212060, 0xc000000000, 0xc000212060)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/lock.go:74 +0x1d2
                github.com/golang/dep.(*Ctx).LoadProject(0xc0003a8000, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/context.go:189 +0x517
                main.(*checkCommand).Run(0xc000433746, 0xc0003a8000, 0xc00000f820, 0x0, 0x0, 0x0, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/check.go:67 +0x6d
                main.(*Config).Run(0xc000364f00, 0x0)
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:212 +0x115d
                main.main()
                	/yocto/build/tmp/work/core2-64-wrs-linux/go-dep/0.5.0-r0/build/src/github.com/golang/dep/cmd/dep/main.go:84 +0x69a
FAIL: github.com/golang/dep/cmd/dep/dep.test

--------------090204020103060006070902--
