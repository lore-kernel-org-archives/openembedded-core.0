Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8F1C531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 16:40:08 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.928.1724431206901702420
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 09:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WG4Ayo4A;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-533461323cdso2537910e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 09:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724431205; x=1725036005; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5ECBG4AtknwMDErftgZ5Rx8dVylYh6vf0SKzAiA4qE=;
        b=WG4Ayo4AV6f5sovT/fdpjukaCgyTktv2n5PY0YczTwOoCaoCQoF9CmASyF5xpGQhNa
         TlbS61RT08hRcybzv0ERrcR4p6jzseRqQRu60a65HSmfraGYhMNHCh5nr0Z+dy1eYxKS
         vFfw36e2X6EDe2JAXugp6iiXagfH4e06gscpvJVzaiWutcyn5OzY5QuENqGms6UsETOW
         iEfbWIAgNo1xu2jgbxUH28zdQ40Bgp0s/acSDyApm7vgMxaHBpRKz0hEfue8L9pi4W+P
         sPtuhf+gPR6x0NsUKn41Znk0uwxLjq4g/YAjbFRqLCvjQ/m2LQOWpmf/lgOkTmwy/zbD
         6KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724431205; x=1725036005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5ECBG4AtknwMDErftgZ5Rx8dVylYh6vf0SKzAiA4qE=;
        b=PT2FDmqtKJxcFFUl7GLEwNLOTsO40YYXmpeNibMD0XsJac4YNLMwAzh8GzS2vRucWW
         lrAa5UgpJ/306UY9JYncb7EM7UJB2KkpoQ010NaC2dshhy/Hk431y6dp414fIQIhDqd0
         ASJczJSQCw4Zww2AnNWD1Rwazyt5ha3kwzWnCcUwfn+HWGA3zT/FeEcY6dy+VBbeAnz2
         R7pYcWp/x+vpPja60whc+zLi7L36KVB9C9KnuznMU9qVwlHxOzjEGbaM8rowM9KqUyNQ
         0nX4fBavXbOXnUZriiDxy1+UikeMUP/5AjSlqEZ6wOy2bUVZ7JqYUa7vI4fKC73rhFh1
         SDRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYG7996YAhQ8RiOyHEFIQh+o2rg/1EntOiJCtxMH3ILnYymrsYy67zP13b4wNZ88p8SlKmPmBy8HzWprc8XpD/3g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzucg+6wGn0dWm4YZrYWc2nDtPo4EHaOY0xAnpsWyp+dMwFukp6
	3Z3MXxmYCmfvoaNf7kfPTmuSuvsjpboe/SNoNd3T2VwdD88qJEx3sRmBHwCIKIwq+HjxjLO/4em
	7eELnxDePrBbTq40YWKwVszlHHsM=
X-Google-Smtp-Source: AGHT+IE3poxn+reCWfidnXCYldhSDnmQqZ55RytQ1YnfKAGzmqzIynqvOe6O8V6qcCs/mKn62v9OVOde9Oikh2yn4Ms=
X-Received: by 2002:a05:6512:108d:b0:533:415e:cd69 with SMTP id
 2adb3069b0e04-53438831ee6mr1712765e87.23.1724431203958; Fri, 23 Aug 2024
 09:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240822161721.6699-1-sdoshi@mvista.com> <9d603884-968b-4439-b88b-2bf8f6aebb9c@windriver.com>
 <7e155c03-a9fc-4611-8452-42983f18ab69@quicinc.com>
In-Reply-To: <7e155c03-a9fc-4611-8452-42983f18ab69@quicinc.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Aug 2024 18:39:52 +0200
Message-ID: <CANNYZj_k-QHOXH-qEu69HTBcza1d3zge6LQkH5JmbxWYmyJVtw@mail.gmail.com>
Subject: Re: [OE-core][master][scarthgap][PATCH] wpa-supplicant: Upgrade 2.10
 -> 2.11
To: quic_vkraleti@quicinc.com
Cc: randy.macleod@windriver.com, sdoshi@mvista.com, 
	openembedded-core@lists.openembedded.org, 
	"steve@sakoman.com" <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 16:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203698

Sorry, no. This same argument can be made for any other component in
scarthgap where a major new release happened after scarthgap was
released. The correct way to provide updated component versions in LTS
is via this layer:
https://git.yoctoproject.org/meta-lts-mixins/

So please send a patch for that.

Alex

On Fri, 23 Aug 2024 at 18:00, Viswanath Kraleti via
lists.openembedded.org
<quic_vkraleti=3Dquicinc.com@lists.openembedded.org> wrote:
>
> Hello Randy,
>
> 2.11 version of wpa-supplicant/hostapd are released almost after 2.5 Year=
s. 2-10 released on 2022-01-16. A lot of people are eagerly waiting for thi=
s release since a long time. 2.11 has crucial HE/IEEE 802.11ax/Wi-Fi 6 supp=
ort and preliminary support for EHT/IEEE 802.11be/Wi-Fi 7. This also suppor=
ts WPA3 which is a mandatory certification for Wi-Fi CERTIFIED=E2=84=A2 dev=
ices.
>
> I do accept this release missed the Sacrthgap cutoff of Yocto community. =
But considering the longevity of Scarthgap (a good 3.5 years from now) & nu=
mber of people interested in Scarthgap, it is best if wpa-supplicant/hostap=
d are switched to 2.11.
>
> // Viswanath
>
> On 8/23/2024 6:26 AM, Randy MacLeod via lists.openembedded.org wrote:
> > For scarthgap, it's good but not mandatory to have Steve on the To/CC l=
ist.
> >
> > On 2024-08-22 12:17 p.m., Siddharth Doshi via lists.openembedded.org wr=
ote:
> >> From: Siddharth Doshi<sdoshi@mvista.com>
> >>
> >> License-Update:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> - README: Change in copyright years as perhttps://w1.fi/cgit/hostap/co=
mmit/README?id=3Dd945ddd368085f255e68328f2d3b020ceea359af
> >> - wpa_supplicant/wpa_supplicant.c: Change in copyright years as perhtt=
ps://w1.fi/cgit/hostap/commit/wpa_supplicant/wpa_supplicant.c?id=3Dd945ddd3=
68085f255e68328f2d3b020ceea359af
> >>
> >> CVE's Fixed:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> - CVE-2024-5290 wpa_supplicant: wpa_supplicant loading arbitrary share=
d objects allowing privilege escalation
> >> - CVE-2023-52160 wpa_supplicant: potential authorization bypass
> >>
> >> Changes between 2.10 -> 2.11:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >> https://w1.fi/cgit/hostap/commit/wpa_supplicant/ChangeLog?id=3Dd945ddd=
368085f255e68328f2d3b020ceea359af
> >
> >
> > Hello Siddharth,
> >
> >
> > This update make sense for the master brnanch but likely not for scarth=
gap unless you can show that
> > this is a bug fix only release.
>
> >
> >
> > It certainly does not look like a small bug fix only update based on:
> >
> > =E2=9D=AF git diff hostap_2_10 hostap_2_11 | diffstat | tail -1
> >  534 files changed, 85965 insertions(+), 16847 deletions(-)
> >
> > =E2=9D=AF git log --oneline hostap_2_10..hostap_2_11 | wc -l
> > 2295
> >
> > and the hostap and wpa-supplicant ChangeLogs which mention adding featu=
res below (1).
> >
> >
> > Since the repo ( git://w1.fi/srv/git/hostap.git ) doesn't have a stable=
 branch for 2.10:
> >
> > =E2=9D=AF git branch -a
> > * master
> >   remotes/origin/HEAD -> origin/master
> >   remotes/origin/android-jb
> >   remotes/origin/android-kk
> >   remotes/origin/android-l
> >   remotes/origin/android-m
> >   remotes/origin/aosp-jb
> >   remotes/origin/aosp-kk
> >   remotes/origin/main
> >   remotes/origin/master
> >   remotes/origin/pending
> >
> >
> > you'll have to backport any CVE fixes that you're interested in unless
> > someone explains why this is a sensible update for scarthgap.
> >
> > Thanks,
> >
> > ../Randy
> >
> >
> > 1)
> >
> >
> > =E2=9D=AF git diff hostap_2_10 hostap_2_11 hostapd/ChangeLog | cat
> > diff --git a/hostapd/ChangeLog b/hostapd/ChangeLog
> > index 279298e4d..1c8240d33 100644
> > --- a/hostapd/ChangeLog
> > +++ b/hostapd/ChangeLog
> > @@ -1,5 +1,42 @@
> >  ChangeLog for hostapd
> >
> > +2024-07-20 - v2.11
> > +    * Wi-Fi Easy Connect
> > +      - add support for DPP release 3
> > +      - allow Configurator parameters to be provided during config exc=
hange
> > +    * HE/IEEE 802.11ax/Wi-Fi 6
> > +      - various fixes
> > +    * EHT/IEEE 802.11be/Wi-Fi 7
> > +      - add preliminary support
> > +    * SAE: add support for fetching the password from a RADIUS server
> > +    * support OpenSSL 3.0 API changes
> > +    * support background radar detection and CAC with some additional
> > +      drivers
> > +    * support RADIUS ACL/PSK check during 4-way handshake (wpa_psk_rad=
ius=3D3)
> > +    * EAP-SIM/AKA: support IMSI privacy
> > +    * improve 4-way handshake operations
> > +      - use Secure=3D1 in message 3 during PTK rekeying
> > +    * OCV: do not check Frequency Segment 1 Channel Number for 160 MHz=
 cases
> > +      to avoid interoperability issues
> > +    * support new SAE AKM suites with variable length keys
> > +    * support new AKM for 802.1X/EAP with SHA384
> > +    * extend PASN support for secure ranging
> > +    * FT: Use SHA256 to derive PMKID for AKM 00-0F-AC:3 (FT-EAP)
> > +      - this is based on additional details being added in the IEEE 80=
2.11
> > +        standard
> > +      - the new implementation is not backwards compatible
> > +    * improved ACS to cover additional channel types/bandwidths
> > +    * extended Multiple BSSID support
> > +    * fix beacon protection with FT protocol (incorrect BIGTK was prov=
ided)
> > +    * support unsynchronized service discovery (USD)
> > +    * add preliminary support for RADIUS/TLS
> > +    * add support for explicit SSID protection in 4-way handshake
> > +      (a mitigation for CVE-2023-52424; disabled by default for now, c=
an be
> > +      enabled with ssid_protection=3D1)
> > +    * fix SAE H2E rejected groups validation to avoid downgrade attack=
s
> > +    * use stricter validation for some RADIUS messages
> > +    * a large number of other fixes, cleanup, and extensions
> > +
> >  2022-01-16 - v2.10
> >      * SAE changes
> >        - improved protection against side channel attacks
> >
> >
> > =E2=9D=AF  git diff hostap_2_10 hostap_2_11 wpa_supplicant/ChangeLog | =
cat
> > diff --git a/wpa_supplicant/ChangeLog b/wpa_supplicant/ChangeLog
> > index efcc6cd9c..3f4162eb0 100644
> > --- a/wpa_supplicant/ChangeLog
> > +++ b/wpa_supplicant/ChangeLog
> > @@ -1,5 +1,55 @@
> >  ChangeLog for wpa_supplicant
> >
> > +2024-07-20 - v2.11
> > +    * Wi-Fi Easy Connect
> > +      - add support for DPP release 3
> > +      - allow Configurator parameters to be provided during config exc=
hange
> > +    * MACsec
> > +      - add support for GCM-AES-256 cipher suite
> > +      - remove incorrect EAP Session-Id length constraint
> > +      - add hardware offload support for additional drivers
> > +    * HE/IEEE 802.11ax/Wi-Fi 6
> > +      - support BSS color updates
> > +      - various fixes
> > +    * EHT/IEEE 802.11be/Wi-Fi 7
> > +      - add preliminary support
> > +    * support OpenSSL 3.0 API changes
> > +    * improve EAP-TLS support for TLSv1.3
> > +    * EAP-SIM/AKA: support IMSI privacy
> > +    * improve mitigation against DoS attacks when PMF is used
> > +    * improve 4-way handshake operations
> > +      - discard unencrypted EAPOL frames in additional cases
> > +      - use Secure=3D1 in message 2 during PTK rekeying
> > +    * OCV: do not check Frequency Segment 1 Channel Number for 160 MHz=
 cases
> > +      to avoid interoperability issues
> > +    * support new SAE AKM suites with variable length keys
> > +    * support new AKM for 802.1X/EAP with SHA384
> > +    * improve cross-AKM roaming with driver-based SME/BSS selection
> > +    * PASN
> > +      - extend support for secure ranging
> > +      - allow PASN implementation to be used with external programs fo=
r
> > +        Wi-Fi Aware
> > +    * FT: Use SHA256 to derive PMKID for AKM 00-0F-AC:3 (FT-EAP)
> > +      - this is based on additional details being added in the IEEE 80=
2.11
> > +        standard
> > +      - the new implementation is not backwards compatible, but PMKSA
> > +        caching with FT-EAP was, and still is, disabled by default
> > +    * support a pregenerated MAC (mac_addr=3D3) as an alternative mech=
anism
> > +      for using per-network random MAC addresses
> > +    * EAP-PEAP: require Phase 2 authentication by default (phase2_auth=
=3D1)
> > +      to improve security for still unfortunately common invalid
> > +      configurations that do not set ca_cert
> > +    * extend SCS support for QoS Characteristics
> > +    * extend MSCS support
> > +    * support unsynchronized service discovery (USD)
> > +    * add support for explicit SSID protection in 4-way handshake
> > +      (a mitigation for CVE-2023-52424; disabled by default for now, c=
an be
> > +      enabled with ssid_protection=3D1)
> > +      - in addition, verify SSID after key setup when beacon protectio=
n is
> > +        used
> > +    * fix SAE H2E rejected groups validation to avoid downgrade attack=
s
> > +    * a large number of other fixes, cleanup, and extensions
> > +
> >  2022-01-16 - v2.10
> >      * SAE changes
> >        - improved protection against side channel attacks
> >
> >
> >>
> >> Note:
> >> =3D=3D=3D=3D=3D
> >> Patches
> >> 0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch,
> >> 0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch,
> >> 0001-Install-wpa_passphrase-when-not-disabled.patch,
> >> 0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch (CVE-2=
023-52160)
> >> are already fixed and hence removing them.
> >>
> >> Signed-off-by: Siddharth Doshi<sdoshi@mvista.com>
> >> ---
> >>   ...all-wpa_passphrase-when-not-disabled.patch |  33 ---
> >>   ...te-Phase-2-authentication-requiremen.patch | 213 ----------------=
--
> >>   ...options-for-libwpa_client.so-and-wpa.patch |  73 ------
> >>   ...oval-of-wpa_passphrase-on-make-clean.patch |  26 ---
> >>   ...plicant_2.10.bb =3D> wpa-supplicant_2.11.bb} |  10 +-
> >>   5 files changed, 3 insertions(+), 352 deletions(-)
> >>   delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0001-Install-wpa_passphrase-when-not-disabled.patch
> >>   delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
> >>   delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch
> >>   delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supp=
licant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch
> >>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.10=
.bb =3D> wpa-supplicant_2.11.bb} (90%)
> >>
> >> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0=
001-Install-wpa_passphrase-when-not-disabled.patch b/meta/recipes-connectiv=
ity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-disa=
bled.patch
> >> deleted file mode 100644
> >> index c04c608bde..0000000000
> >> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Ins=
tall-wpa_passphrase-when-not-disabled.patch
> >> +++ /dev/null
> >> @@ -1,33 +0,0 @@
> >> -From 57b12a1e43605f71239a21488cb9b541f0751dda Mon Sep 17 00:00:00 200=
1
> >> -From: Alex Kiernan<alexk@zuma.ai>
> >> -Date: Thu, 21 Apr 2022 10:15:29 +0100
> >> -Subject: [PATCH] Install wpa_passphrase when not disabled
> >> -
> >> -As part of fixing CONFIG_NO_WPA_PASSPHRASE, whilst wpa_passphrase get=
s
> >> -built, its not installed during `make install`.
> >> -
> >> -Fixes: cb41c214b78d ("build: Re-enable options for libwpa_client.so a=
nd wpa_passphrase")
> >> -Signed-off-by: Alex Kiernan<alexk@zuma.ai>
> >> -Signed-off-by: Alex Kiernan<alex.kiernan@gmail.com>
> >> -Upstream-Status: Submitted [http://lists.infradead.org/pipermail/host=
ap/2022-April/040448.html]
> >> ----
> >> - wpa_supplicant/Makefile | 3 +++
> >> - 1 file changed, 3 insertions(+)
> >> -
> >> -diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
> >> -index 0bab313f2355..12787c0c7d0f 100644
> >> ---- a/wpa_supplicant/Makefile
> >> -+++ b/wpa_supplicant/Makefile
> >> -@@ -73,6 +73,9 @@ $(DESTDIR)$(BINDIR)/%: %
> >> -
> >> - install: $(addprefix $(DESTDIR)$(BINDIR)/,$(BINALL))
> >> -     $(MAKE) -C ../src install
> >> -+ifndef CONFIG_NO_WPA_PASSPHRASE
> >> -+    install -D wpa_passphrase $(DESTDIR)/$(BINDIR)/wpa_passphrase
> >> -+endif
> >> - ifdef CONFIG_BUILD_WPA_CLIENT_SO
> >> -     install -m 0644 -D libwpa_client.so $(DESTDIR)/$(LIBDIR)/libwpa_=
client.so
> >> -     install -m 0644 -D ../src/common/wpa_ctrl.h $(DESTDIR)/$(INCDIR)=
/wpa_ctrl.h
> >> ---
> >> -2.35.1
> >> -
> >> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0=
001-PEAP-client-Update-Phase-2-authentication-requiremen.patch b/meta/recip=
es-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase=
-2-authentication-requiremen.patch
> >> deleted file mode 100644
> >> index 620560d3c7..0000000000
> >> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEA=
P-client-Update-Phase-2-authentication-requiremen.patch
> >> +++ /dev/null
> >> @@ -1,213 +0,0 @@
> >> -From f6f7cead3661ceeef54b21f7e799c0afc98537ec Mon Sep 17 00:00:00 200=
1
> >> -From: Jouni Malinen<j@w1.fi>
> >> -Date: Sat, 8 Jul 2023 19:55:32 +0300
> >> -Subject: [PATCH] PEAP client: Update Phase 2 authentication requireme=
nts
> >> -
> >> -The previous PEAP client behavior allowed the server to skip Phase 2
> >> -authentication with the expectation that the server was authenticated
> >> -during Phase 1 through TLS server certificate validation. Various PEA=
P
> >> -specifications are not exactly clear on what the behavior on this fro=
nt
> >> -is supposed to be and as such, this ended up being more flexible than
> >> -the TTLS/FAST/TEAP cases. However, this is not really ideal when
> >> -unfortunately common misconfiguration of PEAP is used in deployed
> >> -devices where the server trust root (ca_cert) is not configured or th=
e
> >> -user has an easy option for allowing this validation step to be skipp=
ed.
> >> -
> >> -Change the default PEAP client behavior to be to require Phase 2
> >> -authentication to be successfully completed for cases where TLS sessi=
on
> >> -resumption is not used and the client certificate has not been
> >> -configured. Those two exceptions are the main cases where a deployed
> >> -authentication server might skip Phase 2 and as such, where a more
> >> -strict default behavior could result in undesired interoperability
> >> -issues. Requiring Phase 2 authentication will end up disabling TLS
> >> -session resumption automatically to avoid interoperability issues.
> >> -
> >> -Allow Phase 2 authentication behavior to be configured with a new pha=
se1
> >> -configuration parameter option:
> >> -'phase2_auth' option can be used to control Phase 2 (i.e., within TLS
> >> -tunnel) behavior for PEAP:
> >> - * 0 =3D do not require Phase 2 authentication
> >> - * 1 =3D require Phase 2 authentication when client certificate
> >> -   (private_key/client_cert) is no used and TLS session resumption wa=
s
> >> -   not used (default)
> >> - * 2 =3D require Phase 2 authentication in all cases
> >> -
> >> -Signed-off-by: Jouni Malinen<j@w1.fi>
> >> -
> >> -CVE: CVE-2023-52160
> >> -Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=3D8e6=
485a1bcb0baffdea9e55255a81270b768439c]
> >> -
> >> -Signed-off-by: Claus Stovgaard<claus.stovgaard@gmail.com>
> >> -
> >> ----
> >> - src/eap_peer/eap_config.h          |  8 ++++++
> >> - src/eap_peer/eap_peap.c            | 40 +++++++++++++++++++++++++++-=
--
> >> - src/eap_peer/eap_tls_common.c      |  6 +++++
> >> - src/eap_peer/eap_tls_common.h      |  5 ++++
> >> - wpa_supplicant/wpa_supplicant.conf |  7 ++++++
> >> - 5 files changed, 63 insertions(+), 3 deletions(-)
> >> -
> >> -diff --git a/src/eap_peer/eap_config.h b/src/eap_peer/eap_config.h
> >> -index 3238f74..047eec2 100644
> >> ---- a/src/eap_peer/eap_config.h
> >> -+++ b/src/eap_peer/eap_config.h
> >> -@@ -469,6 +469,14 @@ struct eap_peer_config {
> >> -      * 1 =3D use cryptobinding if server supports it
> >> -      * 2 =3D require cryptobinding
> >> -      *
> >> -+     * phase2_auth option can be used to control Phase 2 (i.e., with=
in TLS
> >> -+     * tunnel) behavior for PEAP:
> >> -+     * 0 =3D do not require Phase 2 authentication
> >> -+     * 1 =3D require Phase 2 authentication when client certificate
> >> -+     *  (private_key/client_cert) is no used and TLS session resumpt=
ion was
> >> -+     *  not used (default)
> >> -+     * 2 =3D require Phase 2 authentication in all cases
> >> -+     *
> >> -      * EAP-WSC (WPS) uses following options: pin=3DDevice_Password a=
nd
> >> -      * uuid=3DDevice_UUID
> >> -      *
> >> -diff --git a/src/eap_peer/eap_peap.c b/src/eap_peer/eap_peap.c
> >> -index 12e30df..6080697 100644
> >> ---- a/src/eap_peer/eap_peap.c
> >> -+++ b/src/eap_peer/eap_peap.c
> >> -@@ -67,6 +67,7 @@ struct eap_peap_data {
> >> -     u8 cmk[20];
> >> -     int soh; /* Whether IF-TNCCS-SOH (Statement of Health; Microsoft=
 NAP)
> >> -           * is enabled. */
> >> -+    enum { NO_AUTH, FOR_INITIAL, ALWAYS } phase2_auth;
> >> - };
> >> -
> >> -
> >> -@@ -114,6 +115,19 @@ static void eap_peap_parse_phase1(struct eap_pea=
p_data *data,
> >> -         wpa_printf(MSG_DEBUG, "EAP-PEAP: Require cryptobinding");
> >> -     }
> >> -
> >> -+    if (os_strstr(phase1, "phase2_auth=3D0")) {
> >> -+        data->phase2_auth =3D NO_AUTH;
> >> -+        wpa_printf(MSG_DEBUG,
> >> -+               "EAP-PEAP: Do not require Phase 2 authentication");
> >> -+    } else if (os_strstr(phase1, "phase2_auth=3D1")) {
> >> -+        data->phase2_auth =3D FOR_INITIAL;
> >> -+        wpa_printf(MSG_DEBUG,
> >> -+               "EAP-PEAP: Require Phase 2 authentication for initial=
 connection");
> >> -+    } else if (os_strstr(phase1, "phase2_auth=3D2")) {
> >> -+        data->phase2_auth =3D ALWAYS;
> >> -+        wpa_printf(MSG_DEBUG,
> >> -+               "EAP-PEAP: Require Phase 2 authentication for all cas=
es");
> >> -+    }
> >> - #ifdef EAP_TNC
> >> -     if (os_strstr(phase1, "tnc=3Dsoh2")) {
> >> -         data->soh =3D 2;
> >> -@@ -142,6 +156,7 @@ static void * eap_peap_init(struct eap_sm *sm)
> >> -     data->force_peap_version =3D -1;
> >> -     data->peap_outer_success =3D 2;
> >> -     data->crypto_binding =3D OPTIONAL_BINDING;
> >> -+    data->phase2_auth =3D FOR_INITIAL;
> >> -
> >> -     if (config && config->phase1)
> >> -         eap_peap_parse_phase1(data, config->phase1);
> >> -@@ -454,6 +469,20 @@ static int eap_tlv_validate_cryptobinding(struct=
 eap_sm *sm,
> >> - }
> >> -
> >> -
> >> -+static bool peap_phase2_sufficient(struct eap_sm *sm,
> >> -+                   struct eap_peap_data *data)
> >> -+{
> >> -+    if ((data->phase2_auth =3D=3D ALWAYS ||
> >> -+         (data->phase2_auth =3D=3D FOR_INITIAL &&
> >> -+          !tls_connection_resumed(sm->ssl_ctx, data->ssl.conn) &&
> >> -+          !data->ssl.client_cert_conf) ||
> >> -+         data->phase2_eap_started) &&
> >> -+        !data->phase2_eap_success)
> >> -+        return false;
> >> -+    return true;
> >> -+}
> >> -+
> >> -+
> >> - /**
> >> -  * eap_tlv_process - Process a received EAP-TLV message and generate=
 a response
> >> -  * @sm: Pointer to EAP state machine allocated with eap_peer_sm_init=
()
> >> -@@ -568,6 +597,11 @@ static int eap_tlv_process(struct eap_sm *sm, st=
ruct eap_peap_data *data,
> >> -                        " - force failed Phase 2");
> >> -                 resp_status =3D EAP_TLV_RESULT_FAILURE;
> >> -                 ret->decision =3D DECISION_FAIL;
> >> -+            } else if (!peap_phase2_sufficient(sm, data)) {
> >> -+                wpa_printf(MSG_INFO,
> >> -+                       "EAP-PEAP: Server indicated Phase 2 success, =
but sufficient Phase 2 authentication has not been completed");
> >> -+                resp_status =3D EAP_TLV_RESULT_FAILURE;
> >> -+                ret->decision =3D DECISION_FAIL;
> >> -             } else {
> >> -                 resp_status =3D EAP_TLV_RESULT_SUCCESS;
> >> -                 ret->decision =3D DECISION_UNCOND_SUCC;
> >> -@@ -887,8 +921,7 @@ continue_req:
> >> -             /* EAP-Success within TLS tunnel is used to indicate
> >> -              * shutdown of the TLS channel. The authentication has
> >> -              * been completed. */
> >> --            if (data->phase2_eap_started &&
> >> --                !data->phase2_eap_success) {
> >> -+            if (!peap_phase2_sufficient(sm, data)) {
> >> -                 wpa_printf(MSG_DEBUG, "EAP-PEAP: Phase 2 "
> >> -                        "Success used to indicate success, "
> >> -                        "but Phase 2 EAP was not yet "
> >> -@@ -1199,8 +1232,9 @@ static struct wpabuf * eap_peap_process(struct =
eap_sm *sm, void *priv,
> >> - static bool eap_peap_has_reauth_data(struct eap_sm *sm, void *priv)
> >> - {
> >> -     struct eap_peap_data *data =3D priv;
> >> -+
> >> -     return tls_connection_established(sm->ssl_ctx, data->ssl.conn) &=
&
> >> --        data->phase2_success;
> >> -+        data->phase2_success && data->phase2_auth !=3D ALWAYS;
> >> - }
> >> -
> >> -
> >> -diff --git a/src/eap_peer/eap_tls_common.c b/src/eap_peer/eap_tls_com=
mon.c
> >> -index c1837db..a53eeb1 100644
> >> ---- a/src/eap_peer/eap_tls_common.c
> >> -+++ b/src/eap_peer/eap_tls_common.c
> >> -@@ -239,6 +239,12 @@ static int eap_tls_params_from_conf(struct eap_s=
m *sm,
> >> -
> >> -     sm->ext_cert_check =3D !!(params->flags & TLS_CONN_EXT_CERT_CHEC=
K);
> >> -
> >> -+    if (!phase2)
> >> -+        data->client_cert_conf =3D params->client_cert ||
> >> -+            params->client_cert_blob ||
> >> -+            params->private_key ||
> >> -+            params->private_key_blob;
> >> -+
> >> -     return 0;
> >> - }
> >> -
> >> -diff --git a/src/eap_peer/eap_tls_common.h b/src/eap_peer/eap_tls_com=
mon.h
> >> -index 9ac0012..3348634 100644
> >> ---- a/src/eap_peer/eap_tls_common.h
> >> -+++ b/src/eap_peer/eap_tls_common.h
> >> -@@ -79,6 +79,11 @@ struct eap_ssl_data {
> >> -      * tls_v13 - Whether TLS v1.3 or newer is used
> >> -      */
> >> -     int tls_v13;
> >> -+
> >> -+    /**
> >> -+     * client_cert_conf: Whether client certificate has been configu=
red
> >> -+     */
> >> -+    bool client_cert_conf;
> >> - };
> >> -
> >> -
> >> -diff --git a/wpa_supplicant/wpa_supplicant.conf b/wpa_supplicant/wpa_=
supplicant.conf
> >> -index 6619d6b..d63f73c 100644
> >> ---- a/wpa_supplicant/wpa_supplicant.conf
> >> -+++ b/wpa_supplicant/wpa_supplicant.conf
> >> -@@ -1321,6 +1321,13 @@ fast_reauth=3D1
> >> - #     * 0 =3D do not use cryptobinding (default)
> >> - #     * 1 =3D use cryptobinding if server supports it
> >> - #     * 2 =3D require cryptobinding
> >> -+#    'phase2_auth' option can be used to control Phase 2 (i.e., with=
in TLS
> >> -+#    tunnel) behavior for PEAP:
> >> -+#     * 0 =3D do not require Phase 2 authentication
> >> -+#     * 1 =3D require Phase 2 authentication when client certificate
> >> -+#       (private_key/client_cert) is no used and TLS session resumpt=
ion was
> >> -+#       not used (default)
> >> -+#     * 2 =3D require Phase 2 authentication in all cases
> >> - #    EAP-WSC (WPS) uses following options: pin=3D<Device Password> o=
r
> >> - #    pbc=3D1.
> >> - #
> >> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0=
001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch b/meta/recip=
es-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-options-=
for-libwpa_client.so-and-wpa.patch
> >> deleted file mode 100644
> >> index 6e930fc98d..0000000000
> >> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-bui=
ld-Re-enable-options-for-libwpa_client.so-and-wpa.patch
> >> +++ /dev/null
> >> @@ -1,73 +0,0 @@
> >> -From cb41c214b78d6df187a31950342e48a403dbd769 Mon Sep 17 00:00:00 200=
1
> >> -From: Sergey Matyukevich<geomatsi@gmail.com>
> >> -Date: Tue, 22 Feb 2022 11:52:19 +0300
> >> -Subject: [PATCH 1/2] build: Re-enable options for libwpa_client.so an=
d
> >> - wpa_passphrase
> >> -
> >> -Commit a41a29192e5d ("build: Pull common fragments into a build.rules
> >> -file") introduced a regression into wpa_supplicant build process. The
> >> -build target libwpa_client.so is not built regardless of whether the
> >> -option CONFIG_BUILD_WPA_CLIENT_SO is set or not. This happens because
> >> -this config option is used before it is imported from the configurati=
on
> >> -file. Moving its use after including build.rules does not help: the
> >> -variable ALL is processed by build.rules and further changes are not
> >> -applied. Similarly, option CONFIG_NO_WPA_PASSPHRASE also does not wor=
k
> >> -as expected: wpa_passphrase is always built regardless of whether the
> >> -option is set or not.
> >> -
> >> -Re-enable these options by adding both build targets to _all
> >> -dependencies.
> >> -
> >> -Fixes: a41a29192e5d ("build: Pull common fragments into a build.rules=
 file")
> >> -Signed-off-by: Sergey Matyukevich<geomatsi@gmail.com>
> >> -Upstream-Status: Backport
> >> -Signed-off-by: Alex Kiernan<alexk@zuma.ai>
> >> -Signed-off-by: Alex Kiernan<alexk@gmail.com>
> >> ----
> >> - wpa_supplicant/Makefile | 19 ++++++++++++-------
> >> - 1 file changed, 12 insertions(+), 7 deletions(-)
> >> -
> >> -diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
> >> -index cb66defac7c8..c456825ae75f 100644
> >> ---- a/wpa_supplicant/Makefile
> >> -+++ b/wpa_supplicant/Makefile
> >> -@@ -1,24 +1,29 @@
> >> - BINALL=3Dwpa_supplicant wpa_cli
> >> -
> >> --ifndef CONFIG_NO_WPA_PASSPHRASE
> >> --BINALL +=3D wpa_passphrase
> >> --endif
> >> --
> >> - ALL =3D $(BINALL)
> >> - ALL +=3D systemd/wpa_supplicant.service
> >> - ALL +=3Dsystemd/wpa_supplicant@.service
> >> - ALL +=3Dsystemd/wpa_supplicant-nl80211@.service
> >> - ALL +=3Dsystemd/wpa_supplicant-wired@.service
> >> - ALL +=3D dbus/fi.w1.wpa_supplicant1.service
> >> --ifdef CONFIG_BUILD_WPA_CLIENT_SO
> >> --ALL +=3D libwpa_client.so
> >> --endif
> >> -
> >> - EXTRA_TARGETS=3Ddynamic_eap_methods
> >> -
> >> - CONFIG_FILE=3D.config
> >> - include ../src/build.rules
> >> -
> >> -+ifdef CONFIG_BUILD_WPA_CLIENT_SO
> >> -+# add the dependency this way to allow CONFIG_BUILD_WPA_CLIENT_SO
> >> -+# being set in the config which is read by build.rules
> >> -+_all: libwpa_client.so
> >> -+endif
> >> -+
> >> -+ifndef CONFIG_NO_WPA_PASSPHRASE
> >> -+# add the dependency this way to allow CONFIG_NO_WPA_PASSPHRASE
> >> -+# being set in the config which is read by build.rules
> >> -+_all: wpa_passphrase
> >> -+endif
> >> -+
> >> - ifdef LIBS
> >> - # If LIBS is set with some global build system defaults, clone those=
 for
> >> - # LIBS_c and LIBS_p to cover wpa_passphrase and wpa_cli as well.
> >> ---
> >> -2.35.1
> >> -
> >> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0=
002-Fix-removal-of-wpa_passphrase-on-make-clean.patch b/meta/recipes-connec=
tivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-on-=
make-clean.patch
> >> deleted file mode 100644
> >> index 53b0fcdf53..0000000000
> >> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix=
-removal-of-wpa_passphrase-on-make-clean.patch
> >> +++ /dev/null
> >> @@ -1,26 +0,0 @@
> >> -From d001b301ba7987f4b39453a211631b85c48f2ff8 Mon Sep 17 00:00:00 200=
1
> >> -From: Jouni Malinen<quic_jouni@quicinc.com>
> >> -Date: Thu, 3 Mar 2022 13:26:42 +0200
> >> -Subject: [PATCH 2/2] Fix removal of wpa_passphrase on 'make clean'
> >> -
> >> -Fixes: 0430bc8267b4 ("build: Add a common-clean target")
> >> -Signed-off-by: Jouni Malinen<quic_jouni@quicinc.com>
> >> -Upstream-Status: Backport
> >> -Signed-off-by: Alex Kiernan<alexk@zuma.ai>
> >> -Signed-off-by: Alex Kiernan<alexk@gmail.com>
> >> ----
> >> - wpa_supplicant/Makefile | 1 +
> >> - 1 file changed, 1 insertion(+)
> >> -
> >> -diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
> >> -index c456825ae75f..4b4688931b1d 100644
> >> ---- a/wpa_supplicant/Makefile
> >> -+++ b/wpa_supplicant/Makefile
> >> -@@ -2077,3 +2077,4 @@ clean: common-clean
> >> -     rm -f libwpa_client.a
> >> -     rm -f libwpa_client.so
> >> -     rm -f libwpa_test1 libwpa_test2
> >> -+    rm -f wpa_passphrase
> >> ---
> >> -2.35.1
> >> -
> >> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2=
.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> >> similarity index 90%
> >> rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.=
10.bb
> >> rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11=
.bb
> >> index 8113bcab09..321dedc58a 100644
> >> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> >> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> >> @@ -5,8 +5,8 @@ BUGTRACKER =3D"http://w1.fi/security/"
> >>   SECTION =3D "network"
> >>   LICENSE =3D "BSD-3-Clause"
> >>   LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D5ebcb90236d1ad640558c3d3cd=
3035df \ - file://README;beginline=3D1;endline=3D56;md5=3De3d2f6c2948991e37=
c1ca4960de84747 \ - file://wpa_supplicant/wpa_supplicant.c;beginline=3D1;en=
dline=3D12;md5=3D76306a95306fee9a976b0ac1be70f705"
> >> +file://README;beginline=3D1;endline=3D56;md5=3D6e4b25e7d74bfc44a32ba3=
7bdf5210a6 \
> >> +file://wpa_supplicant/wpa_supplicant.c;beginline=3D1;endline=3D12;md5=
=3Df5ccd57ea91e04800edb88267bf8eae4"
> >>     DEPENDS =3D "dbus libnl"
> >>   @@ -15,12 +15,8 @@ SRC_URI =3D"http://w1.fi/releases/wpa_supplicant-=
${PV}.tar.gz \ file://wpa_supplicant.conf \ file://wpa_supplicant.conf-sane=
 \ file://99_wpa_supplicant \ - file://0001-build-Re-enable-options-for-lib=
wpa_client.so-and-wpa.patch \ - file://0002-Fix-removal-of-wpa_passphrase-o=
n-make-clean.patch \ - file://0001-Install-wpa_passphrase-when-not-disabled=
.patch \ - file://0001-PEAP-client-Update-Phase-2-authentication-requiremen=
.patch \ "
> >> -SRC_URI[sha256sum] =3D "20df7ae5154b3830355f8ab4269123a87affdea59fe74=
fe9292a91d0d7e17b2f"
> >> +SRC_URI[sha256sum] =3D "912ea06f74e30a8e36fbb68064d6cdff218d8d591db0f=
c5d75dee6c81ac7fc0a"
> >>     S =3D "${WORKDIR}/wpa_supplicant-${PV}"
> >>
> >>
> >>
> >
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203696): https://lists.openembedded.org/g/openembedde=
d-core/message/203696
> Mute This Topic: https://lists.openembedded.org/mt/108040776/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

