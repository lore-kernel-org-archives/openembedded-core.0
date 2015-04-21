Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ABC7A71144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 15:49:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 21 Apr 2015 08:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,616,1422950400"; d="scan'208";a="559504968"
Received: from tkkaskin-mobl3.ger.corp.intel.com ([10.252.23.126])
	by orsmga003.jf.intel.com with ESMTP; 21 Apr 2015 08:49:17 -0700
Message-ID: <55367179.8090800@linux.intel.com>
Date: Tue, 21 Apr 2015 18:49:13 +0300
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: PulseAudio in Sato
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
X-List-Received-Date: Tue, 21 Apr 2015 15:49:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I started the work to enable PulseAudio in Sato images 
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=7517). The first 
problem I faced is that PulseAudio isn't starting automatically. When 
using PulseAudio in a graphical session, the normal way to start the 
server is to rely on autospawning, which means that when the first 
client tries to use PulseAudio, the server gets automatically started by 
libpulse. That's not working in Sato, because the graphical session runs 
as root in Sato, and autospawning is disabled when running as root. Why? 
Well, at least one reason for the disabling is that if the user runs 
some random stuff with sudo, starting another PulseAudio server in the 
background for root will likely mess up the audio in the user's main 
session when the two servers are trying to access the same hardware.

My first thought was that Sato should work more like a normal system, 
and not run the graphical session as root, but then I thought that there 
probably are embedded systems with graphics where it makes sense to run 
everything as root, so that's a valid use case to support. Therefore, it 
would make sense to modify PulseAudio so that it would allow 
autospawning for root. That should be configurable, however, and root 
autospawning should be enabled only on these everything-running-as-root 
systems.

I'm planning to add a new option to /etc/pulse/client.conf: 
"allow-autospawn-for-root". I'm not sure how to meet the goal of 
disabling that option by default, and enabling it in Sato. I think it 
could be done so that the default version of client.conf would be 
packaged in the main pulseaudio recipe, and then there would be a 
separate recipe, "pulseaudio-client-conf-sato", which would replace the 
default pulseaudio-client-conf package. (Currently client.conf is in the 
libpulse package, so it would have to be split off into its own package 
first.) I don't know if this is the best way to do it, feedback would be 
very welcome.

-- 
Tanu

