Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AF61A78438
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 12:32:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6LCWjZE030224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 21 Jul 2017 13:32:47 +0100
Message-ID: <1500640365.22282.104.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org,
	paul.eggleton@linux.intel.com, ross.burton@intel.com
Date: Fri, 21 Jul 2017 13:32:45 +0100
In-Reply-To: <0f028eac-d2d0-3ab8-232c-658db5b7cc6d@windriver.com>
References: <cover.1500450690.git.liezhi.yang@windriver.com>
	<0f028eac-d2d0-3ab8-232c-658db5b7cc6d@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 21 Jul 2017 13:32:47 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [RFC PATCH 0/5] revive runtime/cases/_ptest.py
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
X-List-Received-Date: Fri, 21 Jul 2017 12:32:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-07-20 at 10:09 +0800, Robert Yang wrote:
> 
> On 07/19/2017 04:16 PM, Robert Yang wrote:
> > 
> > Hello,
> > 
> > These patches can make ptest test case work, RP has suggested we
> > write a tool to
> > do the regression check on ptest result, I think that the use case
> > is like:
> > 
> > $ bitbake <image> -ctestiamge # Suppose we add ptest to default
> > test cases in the future
> > # Upgrade a recipe form V1.0 to V1.1
> > $ bitbake <image> -ctestiamge # Run the test again
> > 
> > Then the regression check tool can report what's different (passed,
> > failed,
> > skipped) between V1.0 and V1.1.
> > 
> > Currently, I'm not sure about where to save the ptest results, I
> > saved it to
> > ${WORKDIR}/testimage/ptest_log atm, e.g.:
> > tmp/work/qemux86-poky-linux/core-image-minimal/1.0-
> > r0/testimage/ptest_log
> I still have to think about more about where to put the test result.

Would buildhistory make sense for these since we already have a
mechanism to store results there between builds?

> > But it will be removed after -cclean, then no regression check can
> > be made, so
> > I'd like to save the ptest results to DEPLOY_DIR_IMAGE if no
> > objections, and
> > make -cclean not remove them. (Or only keep the latest 2 results).
> > 
> > And I'm not sure where to add the regression check/tool, maybe one
> > of:
> > 1) Add a separate tool in oe-core/scripts, this can make it easy to
> > do regression
> >    check among different build directories, and
> > runtime/cases/_ptest.py can invoke it.
> I'm leaning to add a script called ptest-regression-check which is
> more flexible, the cases/ptest.py or buildhistory (also the user) can
> run it when needed.

I'd either add a script, or perhaps an option to the buildhistory-diff? 
Paul might have some adivce on that. I would like to understand if
there is a good reason we can't use buildhistory to at least help with
some of this?

Cheers,

Richard

