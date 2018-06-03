Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D744B744DB
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 15:41:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w53Ffp6d019685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 3 Jun 2018 16:41:54 +0100
Message-ID: <8c627bc5394a43727d779b940a32a1e9710da4e4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 03 Jun 2018 16:41:50 +0100
In-Reply-To: <ffb034a5-5c08-0818-db61-cebe40d48efc@windriver.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
	<23d9ef25030216df5bcfeccfe6dcf12defc53648.1527755434.git.Qi.Chen@windriver.com>
	<CANNYZj_M2f=R+mro8oUnVV+dWuz42o8T9GpYjhBeujPF=ic=ow@mail.gmail.com>
	<4de3e30e-48da-24ad-55e9-9b6a3664e67c@windriver.com>
	<CANNYZj9sAHZztGjP6W1i51cN4+GMppnJEus5oJoseeeHSTcYbg@mail.gmail.com>
	<ffb034a5-5c08-0818-db61-cebe40d48efc@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/14] oeqa/core/loader.py: support the 'auto' keyword
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
X-List-Received-Date: Sun, 03 Jun 2018 15:41:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-01 at 13:58 +0800, ChenQi wrote:
> On 06/01/2018 01:41 PM, Alexander Kanavin wrote:
> > 2018-06-01 7:42 GMT+03:00 ChenQi <Qi.Chen@windriver.com>:
> > > I agree with you that we need to re-evaluate the settings of
> > > DEFAULT_TEST_SUITES.
> > > 
> > > I plan to do this work from next week. And I plan to put such
> > > changes in
> > > another patchset.
> > > 
> > > Looking at the codes, I can see that the DEFAULT_TEST_SUITES are
> > > set with
> > > consideration of qemu machines and libc.
> > > e.g.
> > > # aarch64 has no graphics
> > > DEFAULT_TEST_SUITES_remove_aarch64 = "xorg"
> > > # musl doesn't support systemtap
> > > DEFAULT_TEST_SUITES_remove_libc-musl = "stap"
> > 
> > I suppose we can introduce TEST_SUITES_EXCLUDE for such cases,
> > which
> > would be considered when 'auto' is expanded to a specific list?
> 
> I don't know yet. I guess if test case is written with more 
> sophisticated considerations, we don't need such variable. But I'm
> not sure about it. I'll start to investigate it from next week.

This patchset looks good, thanks for working on it.

The original intent of some of these values was to indicate which tests
were expected to pass for which images. I think in 2.6 we have some
people working on collecting up the test results for a given build,
then having a comparison tool which compares that set of results with a
list of tests we expect to pass.

The desire here is to detect when something that should get tested is
no longer getting tested because the test isn't running.

I'm pretty sure the existing mechanism isn't fit for purpose though.

I also want to change some things like getting rid of testimage_auto
and changing that to be configurable with a variable. I'd noticed it
was totally broken so I doubt anyone can have been using it...

Cheers,

Richard







