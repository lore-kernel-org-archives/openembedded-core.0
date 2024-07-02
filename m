Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE8FC30658
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 13:26:39 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.60])
 by mx.groups.io with SMTP id smtpd.web10.24331.1719926789961251116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 06:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=IBngPDyl;
 spf=pass (domain: prevas.dk, ip: 40.107.104.60, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nzo5JhqZGnwtV//KDIXmyKzJVVV66S7Jk81tHVtuHBKDTZI5w8L1PyRK0TbmicYKIJ+J52r0zu4Zy+x0W6EwP3lS0oBos2EiJwHKJBH30jcd+ms3JNo4+qYBRVKc2yd5YozdVvr7Qdoaxa2c+Yrbe0v7y/iF06cvlydcwMrzM3U6StmwtqhT+I2zqm7GOzEEfKBfttnNVOi4RaqRuH56MAuNZnwZNRIQvNJfCbwX0OOfHtki1hEgmD7ye9apA+gypsL5d+5/o0uah3C0av9qud6oR+Pj1P08ikoy9xxFH7pjT0DPLbmt4RUkZyO53FGGDvVL5YWxW99HCRypCqkuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQxOOaMSlG0maT0ewCCXON7RipjeO5nnzJ5nqwWer0s=;
 b=SR1u5aySWC5+DzeCQ67YSJmtbXC878pZQ8sTzuLCEQIIUluoL0U/UKsk7jy9WgcUHa8HFmv78WmBH98M4AMrpLbdQmDLgJ6bdrky6ZdVvnJRZFLMX/rp3br0/LjeJHXyAfYOmeGJuB2qkcR0EeVIzEbPvKuluF8XPJm9cjNi1yzJKj8HIRUJpiA2xeB+oVw2wOzQvVXiXnpP9G9eO9alkQ3bMmeZaJicihQyhqkLZC+GVVu33zVI3K2NDSKmk9pbWIAAVtoQHgo5Ra9S3tJczpI636X+7C4ilyWZuCbJ0hXQH/YaaulX6T7iM/EIKSVgmu6Blf8w8osDlC3PmJMvyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQxOOaMSlG0maT0ewCCXON7RipjeO5nnzJ5nqwWer0s=;
 b=IBngPDylj1gBcbRtEJuXARMmzURjEOUosrITUYrk6q5T/H2mQ7Bku7QntdfI4Woi3HbRuHTy2RJCbZxhegvFXS4a+x2vGS9rdesB7WBXAtoDukfjcR69xVcY7r2AmpJ+vXJLG2OWoLAXVfFMlRiv4dkSRdb5euJNUW2UAWM1LUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS8PR10MB7588.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:562::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Tue, 2 Jul
 2024 13:26:25 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%3]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 13:26:25 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: mbullock@thegoodpenguin.co.uk
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] openssh: allow configuration of hostkey type
In-Reply-To: <20240627131557.2047296-1-mbullock@thegoodpenguin.co.uk> (Matthew
	Bullock via lists openembedded org's message of "Thu, 27 Jun 2024
	14:15:56 +0100")
References: <20240627131557.2047296-1-mbullock@thegoodpenguin.co.uk>
Date: Tue, 02 Jul 2024 15:26:25 +0200
Message-ID: <87le2jrkla.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::19) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS8PR10MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: 367cc1f2-844e-4a23-be06-08dc9a9a924f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|41320700013|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7DDFpVQkuwmf1nr+VgXlUpOiUlW4q0mg7/NSm+R6nD/7k4NbLmdDfqTmzjOi?=
 =?us-ascii?Q?TFAQtmhyNiexVvVG77FXLIOUN/FykkLxWTQFHBIZVmdzHzu0sUM7iNnvoTME?=
 =?us-ascii?Q?NbnH3qHR4CdT9e7w3gMCGg4S+zuXXuyZs70DEQy7c3fLPwfAdiwLb1BGHbCQ?=
 =?us-ascii?Q?pego05CFDsr/zjSFXoDhWeG83n0xF0dWIeqSSFL/jKOvYU3oRIHZ7d5f1Uzv?=
 =?us-ascii?Q?nUNTpya1i0Lw/owmcErYlHdQt8+SxZAfZYRb80l67dcxSHNJQutLUi82Yyng?=
 =?us-ascii?Q?ifitTSy/GmXy9mq6rbDCkapfQ485ULuJBkmD+XtjV/ZmYU8JeZL3cwH4AMtt?=
 =?us-ascii?Q?WT8oOD4YRhBAY/hlZiJ9g8RU5VyzVrEVXJITBtiOPZnXsFLV2j/gxRV8QSMw?=
 =?us-ascii?Q?uL5n//nW74VNeQTWN8GRNOBOpNFHMM2Lgm8ukyWke1rJR5bcXOLAzsNs1hiu?=
 =?us-ascii?Q?c0HOWL1tdtd34IvgAVzlEA6lg1M6+kUkX9+3SvykKUIqdms+5+9j777pS6PU?=
 =?us-ascii?Q?mRuV4D9huT2ikEIEuUc7HFuwIlm2n5Cd8DD2iJN/M1i71QBrryqDnL52IRyU?=
 =?us-ascii?Q?Np3u/B3sWWZyKQNIADTjdiOXRtQNfZ4I3OGHtkUehBYJXnwkYt7JgBZUZVml?=
 =?us-ascii?Q?cQb/DVjalzt3tA7q6uql253jaiFuCP6lvxZnIxHqVNoUfJkuaVuGYA4Ni15P?=
 =?us-ascii?Q?AJ2R/JYT4LzadTXgOaz9XIC7clTBV2dvv2Wk2twNYc26JtzmAnRGZvuWq/WE?=
 =?us-ascii?Q?MMDrCOrczngoAaCFzn2kavJeMP8bBcVqIFbrjUCWa9tVsuaXBbyZK3fntH7p?=
 =?us-ascii?Q?EMyMoI2qB5jjclGHTfb1C8lQKtTMxC2Jn6feJB9zip/k9Xjuoyryu93DjI21?=
 =?us-ascii?Q?QFHAxsba4x54HsTpIpOqvIdBez/pguJ+J3t2QOqq4WQM+QTfjzQIujcQ8b9V?=
 =?us-ascii?Q?kzgYPcjIcJBU2kwaxwvHG18+9T5LrRBdE82PzDFRjXXLChutULULEifQQeaj?=
 =?us-ascii?Q?Gw4M7UBYCuje6cd2nLX7c034bxyoGojx4IfHssmbsB/wQNwv9licAXAwEmC6?=
 =?us-ascii?Q?NfeoRqIkcFkgMDk3m/16ggvrj0iOgWC1eDALN16b4l0ZyQnYZkArXt+Wdpr7?=
 =?us-ascii?Q?xHnH0KYgkSCz79Y1Ovg5H2HiDqzFj+ZmW1FWsUG0mJJmcTTZM1CXqmuaGaNa?=
 =?us-ascii?Q?74Oz101Qds5bgmNoN9HGh1pncygh81D793MAR6tiBPY82n4ntJsVtY1WsjgC?=
 =?us-ascii?Q?kxEEShe3bYoLsXwKV/sRzb7UT1QCxOsDzfOcxSgT9EdO/85G2Y8dR5ZDdfEL?=
 =?us-ascii?Q?cdZVDVhb3fSovuWsBWJSgWxJU48xXmObXWOcfh/6VVhbzPc1NCsbnvyE6BR6?=
 =?us-ascii?Q?DITvoE6Cfii3slCGMUjrVJPXb8f13A5COnosLTBA1MkEXH1bMw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(41320700013)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nlPQqkSVy/n/2WxhFxmBhb9z4/R/uZKlzRju+xrFqK4LomKChNX5e9S0k/8z?=
 =?us-ascii?Q?OMxQEV9u5Mrxip9MysbxE3hsxcYeBc8I/njPK1XD4lchZcGOvREbRbnCcA2V?=
 =?us-ascii?Q?nm6rRunX5PqmGeGwc455b2hMzvYI4FsjrY9G1+hfZmRuy6t/pmN+BOUynWrI?=
 =?us-ascii?Q?WD3ar2NtPG8zJGqEk1iKC3YlBwCfB2W3bWhI2Vi6WiW46yPOFGvfDeFVLF8M?=
 =?us-ascii?Q?Lbg1INxpei7amq9604OdG9+/H4TVUl0UP9qZSuUbjVLK/ZtHt1Rlqgv+gFft?=
 =?us-ascii?Q?LGLveOZoM/lqTDAU+EbWxQyRpjftE3k8ohJdaLisRRrbVWMTCPBVVRzwuutc?=
 =?us-ascii?Q?pg1/aCSuYouXh2FwMY73+syV6lqTmouiBL8zR/Y5kf1gAu7u1Ir6ZS05Gqpi?=
 =?us-ascii?Q?c3939MzrlLg8UAZTsXHiBvGJzqenrAmVR9cJeSAmy++kf6PGSWivmpkH+s+f?=
 =?us-ascii?Q?+BM5VWWvmSoA8QAzMljlKMDWomLy6TYqEfOUXMGC/faMD7um4JDhk0YqKNOs?=
 =?us-ascii?Q?3WlhwpT9xOIpHEO452vvR47/2mVot1YFVcPSUiXHolQyeuHYRGRoEVvcI7ZN?=
 =?us-ascii?Q?oafsuqemWDLUtDAH87TemboFPzda01il7HqSKiRAp3IRHPlEdTrKURYuqYim?=
 =?us-ascii?Q?HHMzQnEjGSWNYotZpjcL9Nkhj2yHzg5RLXNhaNfCgqwqRJ4NfcaH/MIAWcVS?=
 =?us-ascii?Q?QzPf50KX5yXQVYKmtN/4x1DhwxvFnawFEWJLjhJz00uE/2N7+d5kwfYs1JvQ?=
 =?us-ascii?Q?XdIgbwy92ZAJdiYm8BqU4RJkZTDWothf0UXD97r0A1Hrxo7VOFPQtDDTlYiP?=
 =?us-ascii?Q?s2cY6OrrNdNGx2FEF51FD8KO0mi7bPgc7P1fVSRtkBC6j7mY5VCwkE/m6qR4?=
 =?us-ascii?Q?IG2kKxMgyYDN+Ud8uXwX39m11KO26eqXVdpz5ffwUvv291yZN9l0SriVn+UL?=
 =?us-ascii?Q?KijqvDWlfw5hPGkD5X4EtaJcmk+SnoMXXM/PAZLpiIPLnV22XE+HtOqNU6LJ?=
 =?us-ascii?Q?51f1kXeO9zwD/GSwhjDnglwzNNmhwzXEhP7FrslnjvejCkj/0D+NXtIj/MNj?=
 =?us-ascii?Q?3jE3EmTNKEBwLGs1n5XEtIin4OKjy4sIWwg4VIqXIwXD33PZE2hWLnuONH4w?=
 =?us-ascii?Q?J0VESYDURmEVKd5mkN0nLHbtU/erzny+pEDkWmVIhpgk+4en6KBrdzRCluBM?=
 =?us-ascii?Q?CXgoPaUMN0lb0TwmyQvtWGEbFsqmcx/tvOzg5jge6K6i+w6TdjAfWdO/6OfT?=
 =?us-ascii?Q?XDxIoesEbNOt7L33EhrXUFuiab9osJK9SB6FbOHtJFHuWF9p3N0cowxkCUkN?=
 =?us-ascii?Q?7DZk6VUnt/2zqGmssMVa1sQD6pwB03HTu1i/O9sd59JNR2GZu7zMoQqWcdl4?=
 =?us-ascii?Q?0H9ZtWN9JZb1+qhTV0lPxko/+NAqW1mZSOHSxhCoxrmwgPq3tXwFoj3zAM/L?=
 =?us-ascii?Q?KrNe1PoyDB3nAgITV5noTgBjVQ0UosDM05HLq6l+mR9S30XDrPsjl3TvngpQ?=
 =?us-ascii?Q?Iu6IGNrND3GExMHPMra8QZIdfVB8vp1c4Z1Jbcx7LRXeackJYZJyGb+G8SLQ?=
 =?us-ascii?Q?abgtdKof4TVBTK5VkBOvkeYXshlmOSIHGP36BA2+zFkFlF6kwhl/5/mD6Mo5?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 367cc1f2-844e-4a23-be06-08dc9a9a924f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 13:26:25.1655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIK3375sxsd6EXDCyZd+u/yd4q174pb91eHbHvp5LEEuO+snPemcz9us6W9BZrMw4TqrIK8aWdCRxG1KoX8a53gSRyRRd61CXB3arxF9YNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7588
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 13:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201423

"Matthew Bullock via lists.openembedded.org"
<mbullock=thegoodpenguin.co.uk@lists.openembedded.org> writes:

> Allow selection of host key types used by openssh via PACKAGECONFIG.
> Any combination of hostkey-rsa, hostkey-ecdsa and hostkey-ed25519 can be
> specified. Default to just generating ecdsa keys.
>
> The current default generates all three keys. This can take a
> significant amount of time on first boot. Having all three keys does not
> significantly increase compatability. Also RSA keys are being deprecated
> as they are no longer considered secure. Using just an ecdsa key reduces
> key generation time by roughly 75%.
>
> Signed-off-by: Matthew Bullock <mbullock@thegoodpenguin.co.uk>
> ---
>  .../openssh/openssh_9.7p1.bb                  | 29 ++++++++++++++++---
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> index ab453f7bbe..0bc14c5553 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> @@ -56,7 +56,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
>  
>  # systemd-sshd-socket-mode means installing sshd.socket
>  # and systemd-sshd-service-mode corresponding to sshd.service
> -PACKAGECONFIG ??= "systemd-sshd-socket-mode"
> +PACKAGECONFIG ??= "systemd-sshd-socket-mode hostkey-ecdsa"
>  PACKAGECONFIG[fido2] = "--with-security-key-builtin,--disable-security-key,libfido2"
>  PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
>  PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
> @@ -64,6 +64,9 @@ PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>  PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
>  PACKAGECONFIG[systemd-sshd-socket-mode] = ""
>  PACKAGECONFIG[systemd-sshd-service-mode] = ""
> +PACKAGECONFIG[hostkey-rsa] = ""
> +PACKAGECONFIG[hostkey-ecdsa] = ""
> +PACKAGECONFIG[hostkey-ed25519] = ""
>  
>  EXTRA_AUTORECONF += "--exclude=aclocal"
>  
> @@ -127,13 +130,31 @@ do_install:append () {
>  	install -m 644 ${UNPACKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
>  	install -m 0755 ${S}/contrib/ssh-copy-id ${D}${bindir}
>  
> +        # Enable specific ssh host keys
> +	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config
> +	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)}; then
> +	    echo "HostKey /etc/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config
> +        fi
> +	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',d)}; then
> +	    echo "HostKey /etc/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config
> +        fi
> +	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false',d)}; then
> +	    echo "HostKey /etc/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config
> +        fi
> +
>  	# Create config files for read-only rootfs
>  	install -d ${D}${sysconfdir}/ssh
>  	install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
>  	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
> -	echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> -	echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> -	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> +	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)}; then
> +	    echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> +        fi
> +	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',d)}; then
> +	    echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> +        fi
> +	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false',d)}; then
> +	    echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
> +        fi

This will break our setup. We rely on the sshd_config including the

Include /etc/ssh/sshd_config.d/*.conf

directive and put a hostkeys.conf file in there, specifying the host
key(s) types and paths we need (we have a readonly rootfs, but do have a
place for persistent and per-machine stuff like this, so we use neither
of the /etc or /var/run paths).

I suppose we can remove hostkey-ecdsa and any other hostkey-* that may
appear in PACKAGECONFIG in the future. But I think others may, for
example, have a .bbappend where they supply a whole alternative
sshd_config with similar explicit HostKey settings, and this would also
break for them.

So perhaps this could/should be guarded by 'grep -i ^hostkey' not
finding anything in sshd_config or sshd_config.d/*.conf ?

Rasmus

