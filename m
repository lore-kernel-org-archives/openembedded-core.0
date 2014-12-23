Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6F0726D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 15:28:57 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id f15so6108446lbj.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 07:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=J17B0VtcTe2r99WH0KRq0bnMwfjhioWCkbx4+6kfzQs=;
	b=CHgfIZ2l+vb1Q1PbQ2eloLwk7pigHIem6J5aiiMHMiOjvlRzYF30g9eKiGM6UAnxvm
	lb/w04eRkf/jWTZteWS5q03TbxO+q+8LABJOlGlt0RILZL3h4EosP+NYlTbCOg4RB1/p
	c69xOlJ1oKlzI1RKtR8W5QCsNo4NFgXH3IMJSuMxcJnuGPP7Pc3H9rg/OiOOBhZIBFXz
	7OGpsey+9Euz1iMvN9+VZ4B07l11idgYnyFyZ15a9MB3nKHR2TOwCoOqWOvTZnU06SbE
	ouWkEAlPeMXBYDfQQiRdcdLy5VeESrw44g+/V+cuaXKPRNd9wn+uTxs79k4aXGcdtYYk
	FcaA==
MIME-Version: 1.0
X-Received: by 10.112.98.99 with SMTP id eh3mr28153563lbb.32.1419348534028;
	Tue, 23 Dec 2014 07:28:54 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Tue, 23 Dec 2014 07:28:53 -0800 (PST)
In-Reply-To: <1419324878.1777.5.camel@linuxfoundation.org>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
	<0247524f2f7ae076fdac8773c3baa0794e5697dd.1418207154.git.bruce.ashfield@windriver.com>
	<lyegrv99wr.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1418989891.13316.10.camel@linuxfoundation.org>
	<ly7fxnon55.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1418991892.13316.12.camel@linuxfoundation.org>
	<lysig715l0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1419324878.1777.5.camel@linuxfoundation.org>
Date: Tue, 23 Dec 2014 11:28:53 -0400
Message-ID: <CADkTA4MPLUw0frJk5vd66MmW8tz82nZ6Xh8oWx-GCusiziPYeA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] kernel: fix out of tree module builds
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
X-List-Received-Date: Tue, 23 Dec 2014 15:29:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 23, 2014 at 4:54 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-12-23 at 03:07 +0100, Enrico Scholz wrote:
>> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>>
>> > In summary, basically, yes. The kernel source is huge and we were
>> > compressing/decompressing it in several places on the critical path.
>> > People were struggling to develop kernels using the system due to the
>> > overhead.
>>
>> I do not see how the new system makes it easier to "develop kernels".
>
> One of the complaints I keep hearing is how long the populate_sysroot
> and package tasks take. I also get complaints about the sstate footprint
> of those tasks.
>
> Imagine you're doing a "bitbake virtual/kernel -c compile -f", hacking
> on a module, you then package and install it onto the target to test.
>
> As things stood, the package and populate_sysroot tasks took a while
> (I'll get to times in a minute). This was particularly true with large
> kernel source directories.
>
> We also had issues about how and when "make scripts" should be run on
> the kernel directory to enable module building and conflicts over people
> wanting the source code to be able to develop modules on target. Not
> everyone wants the latter but it should be available to those who do
> want it and the old kernel-dev package was basically crippled.
>
> Taking a step back from things and keeping in mind some of the
> "developer experience" goals of the 1.8 release, we therefore looked at
> how we could improve things. The biggest problem and overhead is the
> amount of copying of a large chunk of data (the kernel source) that we
> make and the fact that it was incomplete in kernel-dev due to wanting
> speed (at the expense of breaking it). The changes therefore look at
> improving things in that area.
>
>>   Due
>> to polluting sources with .config and related files, KBUILD_OUTPUT/VPATH
>> builds are not possible from this tree.
>
> Agreed and I'm actually not happy about this. I think going forward
> we'll need a second directory for these so we do keep the output
> separate and can recompile against it. Bruce, please take note we
> probably need to change this.


Noted. And I have a patch in flight for this. I started it before leaving
for the holidays, but with the other build issues, I didn't get a chance to
complete it. This is priority #1 either over the holidays (unlikely, but I
can hope) or the first weeks of January.

Bruce

>
>> In my experience, it is also a pain to jump between the different
>> directories and tools like 'cscope' are not prepared of it.
>>
>> And more importantly: the new system lowers end user experience
>> significantly because kernel messages will show absolute buildsystem
>> paths now; e.g.
>>
>> | /srv/.oe/bld/e6ca2c38-c20d-f57f-7eca-ffc0aaa2f0bd/sysroots/kk-trizeps6/usr/src/kernel/drivers/usb/core/hub.c
>>
>> vs.
>>
>> | drivers/usb/core/hub.c
>
> See my other email on the two sides to this. Here I can tell from a cut
> and pasted failure which revisions you were trying to build so it
> actually makes the logs more useful in some contexts. That isn't the
> reason we've done this but I'd say it can be helpful.
>
>> VPATH builds might be interesting for QA (e.g. building from same source
>> with different configuration) but should not be used for final builds.
>>
>>
>> > Whilst this approach does bypass some parts of the system, I do believe
>> > the benefits are worth it. We're talking about making the kernel build
>> > time about three times faster iirc,
>
> I did say "iirc" and I don't exactly remember the circumstances I tested
> that, see below, sorry :(.
>
>> I can not reproduce these numbers here; I get (after a '-c cleanall' and
>> 'ccache -c'):
>>
>>   | Task                         | time (old) | time (new) |
>>   |------------------------------+------------+------------|
>>   | do_bundle_initramfs          |   0.087052 |   0.034955 |
>>   | do_compile                   | 128.242407 | 133.723027 |
>>   | do_compile_kernelmodules     |  84.415655 |  83.249409 |
>>   | do_compile_prepare           |   2.885401 |   1.714159 |
>>   | do_configure                 |   6.202691 |   4.340526 |
>>   | do_deploy                    |  13.991785 |   14.07096 |
>>   | do_fetch                     |   0.210244 |   1.425304 |
>>   | do_generate_initramfs_source |   0.063915 |   0.041925 |
>>   | do_install                   |  16.190504 |    2.91906 |
>>   | do_package                   | 120.823374 |  16.422429 |
>>   | do_package_qa                |            |   2.557622 |
>>   | do_package_write_ipk         |   42.50694 |   29.57585 |
>>   | do_packagedata               |   1.612542 |   0.462001 |
>>   | do_patch                     |   0.186583 |   0.011232 |
>>   | do_populate_lic              |   0.795013 |   0.135186 |
>>   | do_populate_sysroot          |  10.142978 |   0.533519 |
>>   | do_rm_work                   |   1.762486 |   0.447187 |
>>   | do_rm_work_all               |   0.049144 |   0.030964 |
>>   | do_sizecheck                 |   0.054441 |   0.035806 |
>>   | do_strip                     |   0.049917 |   0.030841 |
>>   | do_uboot_mkimage             |   9.032543 |   12.83624 |
>>   | do_unpack                    |   6.695678 |   9.322173 |
>>
>>   | old | 446.00129 |
>>   | new | 313.92038 |
>
> So you have a gain here from 7.4 mins to 5.2 mins which isn't bad. I'd
> observe your numbers suggest you have pretty fast disk IO, I've seen the
> populate_sysroot task take a lot longer due to the amount of data being
> copied around. Keep in mind that whilst do_package improved, so did
> package_write_ipk, rm_work, install and populate_sysroot, all quite a
> bit more than "three times".
>
> I suspect my "three times" number comes from my highly parallel core
> system where the do_compile/do_compilemodules step runs extremely
> quickly (say 20s) but do_package was about the same as this so you can
> imagine if you reduce do_package from 120s to 16s, you could see an
> increase of about "three times".
>
> To give another perspective on the times, we run "official" benchmarks
> of some things and the line before and after the changes merged from
> that log is:
>
> fedora19,master:88528a128fe7c11871c24706ff6d245b183d6975,1.7_M2-1510-g88528a1,1:18:03,11:16.26,1:13:35,4:11.18,0:34.68,0:15.72,0:01.08,24805964,5548960
> fedora19,master:b99419ff4c1b5ac1e4acd34d95fffd3ac5458bad,1.7_M2-1553-gb99419f,1:13:20,8:10.41,1:10:07,4:08.31,0:34.67,0:15.77,0:01.05,24385880,5956872
>
> What that shows is that:
>
> The "bitbake core-image-sato -c rootfs" time without rm_work went from
> 1:18 to 1:13, i.e. improved 5 mins.
>
> The "bitbake virtual/kernel" time went from 11:16 to 8:10, i.e. improved
> by 3 mins.
>
> The "bitbake core-image-sato -c rootfs" time with rm_work went from 1:13
> to 1:10, i.e. improved 3 mins.
>
> and the size of the build with rm_work increased by around 500MB, the
> size of the build without rm_work decreased by 500MB.
>
> I will also add that we're not done yet with some of these tweaks. I
> know linux-yocto is doing some things in do_patch that are performance
> intensive and we plan to fix those which will further improve the 11
> mins number above.
>
>> Although the 'new' system is faster, this is gained mainly by the
>> 'do_package' task which does not seem to be comparable.  The new
>> method will create only a very small 'kernel-dev' subpackage:
>>
>>    1,1M    tmp/deploy/ipk/kk_trizeps6/kernel-dev_3.14...
>>
>> vs.
>>
>>     36M    tmp/deploy/ipk/kk_trizeps6/kernel-dev_3.14...
>>
>> so the old task can be improved either by removing some files, or the
>> new task misses files.
>
> There is a new kernel-devsrc package which contains some things that
> used to be in kernel-dev. It is way more complete and functional than
> the old one ever was since the old one was a hacked up copy of the
> kernel source. It also only gets built if you request it, only a small
> number of people need it and its hence much more user friendly this way.
>
> I am sorry you're not happy about the changes :(.
>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

