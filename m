Return-Path: <Sebastian.Wiegand@gersys.de>
Received: from mout.kundenserver.de (unknown [212.227.126.187])
	by mail.openembedded.org (Postfix) with ESMTP id B9A85605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:34:12 +0000 (UTC)
Received: from remote.gersys.de (p50991dcb.dip0.t-ipconnect.de [80.153.29.203])
	by mrelayeu.kundenserver.de (node=mreue004) with ESMTP (Nemesis)
	id 0Lgc09-1X7vpW1r3l-00o2S7; Thu, 22 May 2014 12:34:11 +0200
Received: from [127.0.0.1] (192.168.16.104) by GERSYS-r710.gersys.local
	(192.168.16.50) with Microsoft SMTP Server (TLS) id 14.1.438.0;
	Thu, 22 May 2014 12:34:10 +0200
Message-ID: <537DD2A2.6000001@gersys.de>
Date: Thu, 22 May 2014 12:34:10 +0200
From: Sebastian Wiegand <sebastian.wiegand@gersys.de>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <CAPbeDCmO-PZOr+8uohAQy5cQR4LPV+-3=048hhLWAijuU5cNWg@mail.gmail.com>
	<537DCA50.2020106@gersys.de>
	<CAJTo0LY6+fwJAnvgq-BUAp=kArxosj9J4wYRsvh42QvawfScpA@mail.gmail.com>
In-Reply-To: <CAJTo0LY6+fwJAnvgq-BUAp=kArxosj9J4wYRsvh42QvawfScpA@mail.gmail.com>
X-Originating-IP: [192.168.16.104]
X-EXCLAIMER-MD-CONFIG: b9d14dc3-f764-4fff-b0ad-ab9b13f2383d
X-Provags-ID: V02:K0:ykgPPOeLyOrAdtu7KNew/K0ORkgtNj/aus7iTmyt7vA
	YuMYBU7Ml7DPGk6mZ6iaLlSBicyJP/7SBscStQUa5klPZ0PR3O
	TjAGniqFqNJQSH81CTXNsolNf7WPD8B1SGEYaHQyZZDz6fENgt
	vbJoaNVhUFfAfC2M0end/3Ns25pLXALSR9xNekDbSnLiuTb84C
	RBzVZuecDf7OEvy1568onI+Uu8hi/rgO1cdxOzwOjmLuxh85wZ
	DKYqSnTDb88hfeT7hBEwpfVuxXAHJa6hQ0pp5WwnkC4r3HJ1Jv
	EneZsbqZF9wetVoFs5/oepN6fG+kqNpkvyT5bpAN7wlBPkaP4f
	If+Xi+BPYQShooyImv1M=
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/16] CVE Patches and updates
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
X-List-Received-Date: Thu, 22 May 2014 10:34:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On Thursday, 22.05.2014 12:10 +0200, Burton, Ross 
<ross.burton@intel.com> wrote:
> On 22 May 2014 10:58, Sebastian Wiegand <sebastian.wiegand@gersys.de> wrote:
>> Reworked and fixed the error message, too.
> Can you send this patch using e.g. git format-patch so the commit
> message is correct, and add a signed-off-by.
>
> Ross
From: Sebastian Wiegand <sebastian.wiegand@gersys.de>
Date: Thu, 22 May 2014 12:24:16 +0200
Subject: [PATCH] distro_features_check.bbclass: fix searching whole list

Search whole list of REQUIRED_DISTRO_FEATURES.
Print only the missing/conflicting feature on error.

Signed-off-by: Sebastian Wiegand <sebastian.wiegand@gersys.de>
---
  meta/classes/distro_features_check.bbclass |    6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/distro_features_check.bbclass 
b/meta/classes/distro_features_check.bbclass
index 8a0ecb7..1f1d6fb 100644
--- a/meta/classes/distro_features_check.bbclass
+++ b/meta/classes/distro_features_check.bbclass
@@ -14,9 +14,9 @@ python () {
          distro_features = (d.getVar('DISTRO_FEATURES', True) or 
"").split()
          for f in required_distro_features:
              if f in distro_features:
-                break
+                continue
              else:
-                raise bb.parse.SkipPackage("missing required distro 
feature %s (not in DISTRO_FEATURES)" % required_distro_features)
+                raise bb.parse.SkipPackage("missing required distro 
feature '%s' (not in DISTRO_FEATURES)" % f)

      conflict_distro_features = d.getVar('CONFLICT_DISTRO_FEATURES', True)
      if conflict_distro_features:
@@ -24,5 +24,5 @@ python () {
          distro_features = (d.getVar('DISTRO_FEATURES', True) or 
"").split()
          for f in conflict_distro_features:
              if f in distro_features:
-                raise bb.parse.SkipPackage("conflicting distro feature 
%s (in DISTRO_FEATURES)" % conflict_distro_features)
+                raise bb.parse.SkipPackage("conflicting distro feature 
'%s' (in DISTRO_FEATURES)" % f)
  }
-- 
1.7.9.5



