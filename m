Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id A5AB4701A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:04:17 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 888EEA4A027
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 09:04:14 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 30B44A4A026
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 09:04:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 09:04:13 +0200 (CEST)
Date: Thu, 17 Jul 2014 09:04:07 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20140717070406.GA2666@mail.itconsulting-heinold.de>
References: <cover.1405497586.git.Chong.Lu@windriver.com>
	<5ff47f75a60d393359e5555ca9a65a61ba744446.1405497586.git.Chong.Lu@windriver.com>
	<CADkTA4MMphKfFSKw5ViEBgYn+fFJbABeO1hZg+cs4j0eqr__Jw@mail.gmail.com>
	<53C72A3A.50101@windriver.com>
	<CADkTA4MSh39enfLcF5VNtkTBpdBtkhZ8ZhkYXPfypKGTxDFe-w@mail.gmail.com>
	<53C77426.3080209@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53C77426.3080209@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH 1/1] perf: split package
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
X-List-Received-Date: Thu, 17 Jul 2014 07:04:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 17, 2014 at 02:58:46PM +0800, Chong Lu wrote:
> 
> On 07/17/2014 10:13 AM, Bruce Ashfield wrote:
> >On Wed, Jul 16, 2014 at 9:43 PM, Chong Lu <Chong.Lu@windriver.com> wrote:
> >>On 07/16/2014 09:04 PM, Bruce Ashfield wrote:
> >>>On Wed, Jul 16, 2014 at 4:00 AM, Chong Lu <Chong.Lu@windriver.com> wrote:
> >>>>Fix incorrect paths to split perf package.
> >>>Can you elaborate here ? This commit message doesn't really tell us much.
> >>>Why is the current split incorrect ? What is the symptom and result of the
> >>>incorrect split ? Are the package contents the same after this change ?
> >>>
> >>>Bruce
> >>Hi Bruce,
> >>
> >>Currently, perf can't split to perf-archive, perf-tests, perf-python and
> >>perf-perl.
> >>All files are included in perf package. For example, like perf-tests
> >>package:
> >>It generates files in '${exec_prefix}/libexec/perf-core/tests', not in
> >>'${libdir}/perf/perf-core/tests'.
> >>So I change the files paths to make split successfully.
> >But that means, whether or not we like it, anything using perf has been using
> >those "non splits" and getting everything when perf is installed.
> >
> >It's also might be in order to make the main perf package RDEPEND on
> >the other three, to keep it consistent. Make it a ?= so it can be overridden,
> >and then we can age it out over time.
> >
> >Bruce
> Do you mean we should set RDEPENDS like:
>     RDEPENDS_${PN} ?= "${PN}-archive ${PN}-tests ${PN}-python ${PN}-perl"
> 
> In perf.bb file, we have RDEPENDS_${PN} += "elfutils", so I think we
> should use
>     RDEPENDS_${PN} += "${PN}-archive ${PN}-tests ${PN}-python ${PN}-perl"
> to keep it consistent. Do you agree?
> 
> Or, we can also revert following commit to make all files in perf package.
>     commit 36c3e923df85e685b707fe6bd84b053a5e366fe4
>     Author: Henning Heinold <henning@itconsulting-heinold.de>
>     Date:   Mon Jun 9 23:21:29 2014 +0200
> 
>         perf: split packging
> 
> Best Regards
> Chong

Please do not destroy the following use case, which is using perf top
WIHTOUT installing perl or python.

Bye Henning

