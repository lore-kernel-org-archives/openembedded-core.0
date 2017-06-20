Return-Path: <brad.mouring@ni.com>
X-Greylist: delayed 782 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Jun 2017 20:53:53 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 75BC971A84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 20:53:53 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5KKpIVt003731; Tue, 20 Jun 2017 15:53:52 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2b6fd5ukhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 20 Jun 2017 15:53:51 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v5KKrpgS027607
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2017 15:53:51 -0500
Received: from us-aus-exch7.ni.corp.natinst.com (130.164.68.17) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 20 Jun 2017 15:53:50 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch7.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 20 Jun 2017 15:53:49 -0500
Received: from ni.com (130.164.49.7) by us-aus-exhub2.ni.corp.natinst.com
	(130.164.68.32) with Microsoft SMTP Server id 15.0.1156.6 via Frontend
	Transport; Tue, 20 Jun 2017 15:53:49 -0500
Received: by ni.com (sSMTP sendmail emulation); Tue, 20 Jun 2017 15:53:49 -0500
Date: Tue, 20 Jun 2017 15:53:49 -0500
From: Brad Mouring <brad.mouring@ni.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20170620205349.GA19584@zardoz.amer.corp.natinst.com>
References: <20170620204029.19499-1-brad.mouring@ni.com>
	<f35ef85f-1868-ef13-1003-3bf1cfc58b89@denx.de>
MIME-Version: 1.0
In-Reply-To: <f35ef85f-1868-ef13-1003-3bf1cfc58b89@denx.de>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-20_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706200360
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
X-List-Received-Date: Tue, 20 Jun 2017 20:53:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 20, 2017 at 10:43:51PM +0200, Marek Vasut wrote:
> On 06/20/2017 10:40 PM, Brad Mouring wrote:
> > As implemented currently, the fw-utils recipe does not allow for
> > ...
> > +# by the U-Boot environment utilities "fw_printenv" and "fw_setenv".
> > +# By default, use the default included in the U-Boot source
> > +UBOOT_FW_ENV_CONFIG ??= "${S}/tools/env/fw_env.config"
> > +
> >  inherit uboot-config
> >  
> >  do_compile () {
> > @@ -19,7 +24,7 @@ do_install () {
> >  	install -d ${D}${sysconfdir}
> >  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
> >  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> > -	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
> > +	install -m 0644 ${UBOOT_FW_ENV_CONFIG} ${D}${sysconfdir}/fw_env.config
> 
> Do we really need yet another variable ? Wouldn't it make more sense to
> add do_install_append_yourmachine() {} in your meta-whatever to
> u-boot-fw-utils_%.bbappend and install whatever additional files you need ?

This is (kinda) what we were doing, there was some discussion as to
whether or not this made sense upstream. I was unsure of the
acceptability of a do_install_append.*() clobbering a file of the
original do_install().

Thanks for the input.

> >  }
> >  
> >  do_install_class-cross () {
> > 
> 
> 
> -- 
> Best regards,
> Marek Vasut

- Brad

