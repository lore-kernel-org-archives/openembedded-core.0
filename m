Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D418F60167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 14:48:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 22 Apr 2015 07:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,623,1422950400"; d="scan'208";a="683990540"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2015 07:48:25 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.178]) by
	IRSMSX101.ger.corp.intel.com ([163.33.3.153]) with mapi id
	14.03.0224.002; Wed, 22 Apr 2015 15:48:24 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] PulseAudio in Sato
Thread-Index: AQHQfErFLFcQGVRdFk2llRjAq+Fs251ZHYSA
Date: Wed, 22 Apr 2015 14:48:23 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F4B178B@irsmsx105.ger.corp.intel.com>
References: <55367179.8090800@linux.intel.com>
In-Reply-To: <55367179.8090800@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: PulseAudio in Sato
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
X-List-Received-Date: Wed, 22 Apr 2015 14:48:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I guess that pulseaudio-client-conf-sato could be added to packagegroup-cor=
e-x11-sato or packagegroup-core-x11-sato-extended, so that the pulseaudio-c=
lient-conf-sato will get selected only for sato images.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Tanu Kaskinen
Sent: Tuesday, April 21, 2015 6:49 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] PulseAudio in Sato

Hi,

I started the work to enable PulseAudio in Sato images (https://bugzilla.yo=
ctoproject.org/show_bug.cgi?id=3D7517). The first problem I faced is that P=
ulseAudio isn't starting automatically. When using PulseAudio in a graphica=
l session, the normal way to start the server is to rely on autospawning, w=
hich means that when the first client tries to use PulseAudio, the server g=
ets automatically started by libpulse. That's not working in Sato, because =
the graphical session runs as root in Sato, and autospawning is disabled wh=
en running as root. Why?=20
Well, at least one reason for the disabling is that if the user runs some r=
andom stuff with sudo, starting another PulseAudio server in the background=
 for root will likely mess up the audio in the user's main session when the=
 two servers are trying to access the same hardware.

My first thought was that Sato should work more like a normal system, and n=
ot run the graphical session as root, but then I thought that there probabl=
y are embedded systems with graphics where it makes sense to run everything=
 as root, so that's a valid use case to support. Therefore, it would make s=
ense to modify PulseAudio so that it would allow autospawning for root. Tha=
t should be configurable, however, and root autospawning should be enabled =
only on these everything-running-as-root systems.

I'm planning to add a new option to /etc/pulse/client.conf:=20
"allow-autospawn-for-root". I'm not sure how to meet the goal of disabling =
that option by default, and enabling it in Sato. I think it could be done s=
o that the default version of client.conf would be packaged in the main pul=
seaudio recipe, and then there would be a separate recipe, "pulseaudio-clie=
nt-conf-sato", which would replace the default pulseaudio-client-conf packa=
ge. (Currently client.conf is in the libpulse package, so it would have to =
be split off into its own package
first.) I don't know if this is the best way to do it, feedback would be ve=
ry welcome.

--
Tanu
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

