Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 952396B7D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 01:41:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2E1fNta027926; Fri, 14 Mar 2014 01:41:23 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id w4_TtKRdg4pL; Fri, 14 Mar 2014 01:41:23 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2E1fDHp027922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 14 Mar 2014 01:41:17 GMT
Message-ID: <1394761267.3808.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 13 Mar 2014 18:41:07 -0700
In-Reply-To: <FA39033B-6625-4625-A550-8A55B5D70FBE@dominion.thruhere.net>
References: <1390302081-29499-1-git-send-email-koen.kooi@linaro.org>
	<20140121130110.GC4100@jama> <52DE6FEA.5070300@linaro.org>
	<FA39033B-6625-4625-A550-8A55B5D70FBE@dominion.thruhere.net>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd 208: move stray /usr/lib/systemd/* into /lib/systemd
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
X-List-Received-Date: Fri, 14 Mar 2014 01:41:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-03-13 at 10:09 +0100, Koen Kooi wrote:
> Op 21 jan. 2014, om 14:02 heeft Koen Kooi <koen.kooi@linaro.org> het volgende geschreven:
> 
> > On 01/21/2014 02:01 PM, Martin Jansa wrote:
> >> On Tue, Jan 21, 2014 at 12:01:21PM +0100, Koen Kooi wrote:
> >>> From: Koen Kooi <koen@dominion.thruhere.net>
> >>> 
> >>> Apps testing for systemd config get confused when both /usr/lib/systemd and /lib/systemd exist. This fixes (among other things) dracut systemd detections.
> >>> 
> >>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >>> ---
> >>>  meta/recipes-core/systemd/systemd_208.bb | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>> 
> >>> diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
> >>> index 6590235..710624c 100644
> >>> --- a/meta/recipes-core/systemd/systemd_208.bb
> >>> +++ b/meta/recipes-core/systemd/systemd_208.bb
> >>> @@ -113,6 +113,12 @@ do_install() {
> >>> 
> >>>          # Delete journal README, as log can be symlinked inside volatile.
> >>>          rm -f ${D}/${localstatedir}/log/README
> >>> +
> >>> +	# fix up libdir confusion
> >>> +	if [ -d ${D}${libdir}/systemd ] ; then
> >>> +		cp -a ${D}${libdir}/systemd/* ${D}${systemd_unitdir}
> >>> +		rm -rf ${D}${libdir}/systemd
> >>> +	fi
> >> 
> >> It's not your fault, but the indentation looks inconsistent with rest of
> >> do_install()
> > 
> > And I did especially pay attention to use tabs after all the meta-oe patches I did :)
> 
> Ping

This kind of patch sets off all the alarm bells. Why? It becomes
impossible to know which recipes this is fixing and whether there are
other underlying issues. Once added it would be near impossible to
remove or improve upon.

I'd much rather we fix recipes to put files into the correct location
and thrown errors if they put files somewhere incorrect.

I appreciate its tempting to hack around it but I'm not keen...

Cheers,

Richard



