Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 465816FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 12:32:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 11 Dec 2015 04:32:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,413,1444719600"; d="scan'208";a="839193128"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Dec 2015 04:32:03 -0800
To: Tom Hochstein <Tom.Hochstein@freescale.com>
References: <1449001866-29286-1-git-send-email-tom.hochstein@freescale.com>
	<60070.10.252.17.232.1449008484.squirrel@linux.intel.com>
	<BN3PR03MB1415F09661073294ECA6D2A2E8090@BN3PR03MB1415.namprd03.prod.outlook.com>
	<CAP9ODKr8E+mYH3rY-XKLnaWMUr0r9bLQhfAmp9iru1vvYQ0MZg@mail.gmail.com>
	<56659548.8090509@linux.intel.com>
	<BN3PR03MB1415A9FC4E4B3D1B7773F618E8E90@BN3PR03MB1415.namprd03.prod.outlook.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <566AC1B4.9050508@linux.intel.com>
Date: Fri, 11 Dec 2015 14:29:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <BN3PR03MB1415A9FC4E4B3D1B7773F618E8E90@BN3PR03MB1415.namprd03.prod.outlook.com>
Cc: Sundararaj Prabhu <Prabhu.Sundararaj@freescale.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] weston-init: Use weston-launch for XWayland
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
X-List-Received-Date: Fri, 11 Dec 2015 12:32:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2015 01:44 AM, Tom Hochstein wrote:

>          # There are multiple ways to start weston.
>          if [ "$WAYLAND_DISPLAY" ]; then
>              echo -e "\aError: Weston is already running."
>              echo "This script does not support launching Weston nested."
>              exit 1
>          else if [ "$DISPLAY" ]; then
>              echo "Launching Weston with the x11 backend"
>              openvt -s weston -- --log=/var/log/weston.log $OPTARGS
>          else
>              echo "Launching Weston with the DRM backend"
>              export XDG_CONFIG_HOME=/etc
>              openvt -v -- weston-launch -- --log=/var/log/weston.log $OPTARGS
>          fi
>
> I still need to test this (and apply the design in systemd), but I wanted your feedback on the approach.

I think this looks okay, but you obviously need to test that all three 
scenarios works as expected. Also, systemd unit file language may not 
support this logic (it's not a full programming language), so the above 
snippet probably needs to be separated into a wrapper script.

Alex


