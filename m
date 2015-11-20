Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 493CD60112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 09:06:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAK96TeZ011856
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 20 Nov 2015 01:06:29 -0800 (PST)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 20 Nov 2015 01:06:28 -0800
Message-ID: <564EE292.5070704@windriver.com>
Date: Fri, 20 Nov 2015 17:06:26 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>, Kang Kai <kai.kang@windriver.com>, 
	Martin Jansa <Martin.Jansa@gmail.com>, Ross Burton <ross.burton@intel.com>,
	Radu Moisan <radu.moisan@intel.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>,
	=?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>,
	Khem Raj <raj.khem@gmail.com>, Koen Kooi <koen@dominion.thruhere.net>,
	Jonathan Liu <net147@gmail.com>
References: <5649BDDE.6030107@dresearch-fe.de> <564AE081.30004@dresearch-fe.de>
	<564CA3F8.9020404@dresearch-fe.de> <564DDDE4.20002@dresearch-fe.de>
In-Reply-To: <564DDDE4.20002@dresearch-fe.de>
X-Originating-IP: [128.224.162.211]
Subject: Re: systemd service vs. update-alternatives (was rsyslog: buggy systemd/ua handling?)
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
X-List-Received-Date: Fri, 20 Nov 2015 09:06:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

I sent out a series of patches regarding syslog & systemd some time ago.
The title is "[OE-core] [PATCH V3 0/4] Fixes for systemd services in 
systemd".
Codes regarding update-alternatives and syslog for 'rsyslog' recipe is 
actually part of the whole fix.
You could try the patch series to see if they work for you.

Regards,
Chen Qi

On 11/19/2015 10:34 PM, Steffen Sledz wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18.11.2015 17:14, Steffen Sledz wrote:
>> On 17.11.2015 09:08, Steffen Sledz wrote:
>>> On 16.11.2015 12:28, Steffen Sledz wrote:
>>>> I'm not sure but i believe there's a bug in the systemd/ua-handling in meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb.
>>>>
>>>> In my opinion this code
>>>>
>>>> if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d): pn = d.getVar('PN', True) d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service') d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True))) d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/rsyslog.service' % (d.getVar('systemd_unitdir', True)))
>>>>
>>>> registers the systemd service file under the (ua-)name "syslog-service". So it should not be
>>>>
>>>> SYSTEMD_SERVICE_${PN} = "${BPN}.service"
>>>>
>>>> but
>>>>
>>>> SYSTEMD_SERVICE_${PN} = "syslog.service"
>>>>
>>>> Right?
>>> Hi experts! Is my assumption correct? If yes i would prepare patches for master, fido and jethro.
> The problem seems to be much more complex then I thought before. :(
>
> The systemd integration for busybox-syslog was introduced by commit cf3618f9a57e46fb78d5be35d473e2dd5290e961.
>
> The do_install stage got among others this line:
>
>    ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
>
> I believe this was made to avoid a package error like this:
>
>    ERROR: Function failed: SYSTEMD_SERVICE_busybox-syslog value syslog.service does not exist
>
> But if another syslog alternative (rsyslog or syslog-ng) will do the same this leads to another error:
>
>    ERROR: The recipe busybox is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>     /home/sledz/work/hipos-dfe.fido/build-closed/tmp-glibc/sysroots/himx0294/lib/systemd/system/syslog.service
>
> So what is th right way to bring a systemd service file and update-alternatives together???
>
> - -- 
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Geschäftsführer: Dr. Michael Weber, Werner Mögle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2
>
> iQIcBAEBAgAGBQJWTd3kAAoJEIz5slJ1krPh0f4QAIoQcwiyYs1l1lCCFhg96xry
> 5wFMCFDdtCCPerpLBPHh0nLcqB5z0JKV9wCfuZu2QBZbh49s/0Qg4F09yN7qT2Bb
> auP3yEVIZrekuVIpQYkXOTI5q+1DrC4QCGMFfm7XaJZiqdOBaP9t1xWMQxzA5W3M
> OyQCH3JDABkD9UJQbsYLs1Qq6jm1rzbD1ZO5Uv0JvZaW+ZyHvDUHN7M+nlCxWFKE
> HPTtri1trgg9iZYZgTG0y2WferO5Unug5TKrFMSLiKv8iwOGha2O45m9nsFWCzZL
> vQ+6z1mnL9syVy6kmOakmc2Q+RnSC6Zx2Y3GbPuUMGtn4Y3neole6YaMJ0Yl+Uk7
> nn49/f7qxAD6sYJu7YaD0oBbEj/ugKbtFzKcwWjAe365h21Cndt2NkhELr1xUk7/
> owwVD60mmPHGCQ6ugT6wSnmLAVO4P5td5HLuDKWIDV2Smtm3XAQ2MQ52vFzr53sh
> dyUq3e5J9zuDbYWmC5xRvv77H7R6eUCltkGNHg5JjkbqtUw4NQWteaHTUpM7KlI1
> 23w0nDU1xACpJDs+TgMzNyo7c+0b0g0SKjw07Qo7aIdNJuHoeik+hJIewMU7KDdl
> BjHy1PIFqXdSPR3myMOMOXlDCYJLJSy19roOr067LSiwXSEwycj93AsqMNzaGSWS
> 8o0HjDbiMarMi2aXCyCH
> =4bav
> -----END PGP SIGNATURE-----
>
>


