Return-Path: <brad.mouring@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5DE7751C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 02:34:23 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5L2UeXu018526; Tue, 20 Jun 2017 21:33:26 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2b6fd5vvve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 20 Jun 2017 21:33:26 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v5L2XP1g005727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2017 21:33:25 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 20 Jun 2017 21:33:24 -0500
Received: from ni.com (130.164.49.7) by us-aus-exhub2.ni.corp.natinst.com
	(130.164.68.32) with Microsoft SMTP Server id 15.0.1156.6 via Frontend
	Transport; Tue, 20 Jun 2017 21:33:24 -0500
Received: by ni.com (sSMTP sendmail emulation); Tue, 20 Jun 2017 21:33:24 -0500
Date: Tue, 20 Jun 2017 21:33:24 -0500
From: Brad Mouring <brad.mouring@ni.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20170621023324.GA20875@zardoz.amer.corp.natinst.com>
References: <20170620204029.19499-1-brad.mouring@ni.com>
	<f35ef85f-1868-ef13-1003-3bf1cfc58b89@denx.de>
	<20170620205349.GA19584@zardoz.amer.corp.natinst.com>
	<89778545-bbd2-56d0-a636-b0c182079b05@denx.de>
MIME-Version: 1.0
In-Reply-To: <89778545-bbd2-56d0-a636-b0c182079b05@denx.de>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-20_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706210042
Cc: Tom Rini <trini@konsulko.com>,
	Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] u-boot-fw-utils: Allow target-specific fw_env.config
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
X-List-Received-Date: Wed, 21 Jun 2017 02:34:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 20, 2017 at 10:59:55PM +0200, Marek Vasut wrote:
> On 06/20/2017 10:53 PM, Brad Mouring wrote:
> > On Tue, Jun 20, 2017 at 10:43:51PM +0200, Marek Vasut wrote:
> >> On 06/20/2017 10:40 PM, Brad Mouring wrote:
> >>> As implemented currently, the fw-utils recipe does not allow for
> >>> ...
> >>> +# by the U-Boot environment utilities "fw_printenv" and "fw_setenv".
> >>> +# By default, use the default included in the U-Boot source
> >>> +UBOOT_FW_ENV_CONFIG ??= "${S}/tools/env/fw_env.config"
> >>> +
> >>>  inherit uboot-config
> >>>  
> >>>  do_compile () {
> >>> @@ -19,7 +24,7 @@ do_install () {
> >>>  	install -d ${D}${sysconfdir}
> >>>  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
> >>>  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> >>> -	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
> >>> +	install -m 0644 ${UBOOT_FW_ENV_CONFIG} ${D}${sysconfdir}/fw_env.config
> >>
> >> Do we really need yet another variable ? Wouldn't it make more sense to
> >> add do_install_append_yourmachine() {} in your meta-whatever to
> >> u-boot-fw-utils_%.bbappend and install whatever additional files you need ?
> > 
> > This is (kinda) what we were doing, there was some discussion as to
> > whether or not this made sense upstream.
> 
> Link?

I know it's not a great answer, but we've not pushed the version of the
branch where these changes are going in. Eventually, they'll end up in
this repo:

https://github.com/ni/meta-nilrt

> > I was unsure of the
> > acceptability of a do_install_append.*() clobbering a file of the
> > original do_install().
> 
> That's probably what really needs to be discussed.
> 
> We can probably add some task which by default installs the
> fw_env.config example and can be overridden in meta-whatever . Maybe the
> others can jump into here and explain how to handle overriding the
> default config file best.

That sounds like a solution that would certainly work for this
use-case, if no one pipes up with objections or a currently-unseen
silver bullet solution, I'll try to whip something together tomorrow
and post. Thanks for the idea.

Denys, I know you keep pushing the "shove it in a do_install_append()",
but to me and my under-informed sensibilities, this seems weird and
unclean to clobber a file in a _append(), would it cause some QA failure?

> -- 
> Best regards,
> Marek Vasut

Regards,
Brad Mouring

