Return-Path: <will.page@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 9738C77ACB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 15:39:35 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v8IFZovt005442; Mon, 18 Sep 2017 10:39:35 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2d2gu881fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 18 Sep 2017 10:39:35 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	v8IFdYXb001088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2017 10:39:34 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 18 Sep 2017 10:39:34 -0500
Received: from canismajor (130.164.49.7) by us-aus-exhub2.ni.corp.natinst.com
	(130.164.68.32) with Microsoft SMTP Server id 15.0.1156.6 via
	Frontend Transport; Mon, 18 Sep 2017 10:39:33 -0500
Date: Mon, 18 Sep 2017 08:39:33 -0700
From: Will Page <will.page@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170918153933.GB29455@canismajor>
References: <20170915222700.GA15457@canismajor>
	<20170915181020.6a184e6a@seebsdell>
	<1505741066.18640.112.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1505741066.18640.112.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-09-18_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1709180224
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [pseudo][PATCH] Fix to fcntl guts to ignore flags that can be ORed into cmd
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
X-List-Received-Date: Mon, 18 Sep 2017 15:39:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 18, 2017 at 02:24:26PM +0100, Richard Purdie wrote:
> On Fri, 2017-09-15 at 18:10 -0500, Seebs wrote:
> > On Fri, 15 Sep 2017 15:27:00 -0700
> > Will Page <Will.Page@ni.com> wrote:
> > 
> > > 
> > > The fcntl guts switch on "cmd" parameter to identify the fcntl
> > > command being issued, but isn't aware of the file creation flags
> > > that
> > > can be ORed in.
> > This is true. I was, in fact, not aware of those flags. Looks
> > reasonable.
> 
> I tried adding this to a test build along with AlexK's epoll patch. It
> resulted in:
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__autobuilder.yocto.io_builders_nightly-2Dworld_builds_475_steps_BuildImages_logs_stdio&d=DwICaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=-PS0OYZ7YP1crHfex64Ojw&m=xLMg1sihnYcY8mm3vbgoq_awtDy2SclWmfP3SxUNhq0&s=qFv8uK99a-cleN6VLJ7XYfBiLHrcTKtPo63E8FmGuX0&e= 
> 
> Any ideas why?
> 
> Cheers,
> 
> Richard

I'm sorry - I was looking over v2 of my patch, and something just wasn't
adding up.

pseudo already supports F_DUPFD_CLOEXEC (which turned out
to be the problematic command for me).  The problem was on my end - I
had two copies of the binary: one that was built on a system where
F_DUPFD_CLOEXEC was defined, and one built on a system where it wasn't.

I repeat, the problem was entirely on my end.  I respectfully retract my
patch, prior statements, and I thank you for your time.

Will Page

