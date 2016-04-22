Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD9C70034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 00:05:48 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.153])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6000BARDKW5G10@vms173007.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2016 19:05:30 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=NEAV23lmAAAA:8
	a=-Mp4Nzkq3keRSt7xLLcA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 39658390; Fri, 22 Apr 2016 00:05:30 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F3F91161FC7; Thu,
	21 Apr 2016 20:05:19 -0400 (EDT)
Date: Thu, 21 Apr 2016 20:05:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20160422000519.GR16135@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: mesa, libgbm and weston
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
X-List-Received-Date: Fri, 22 Apr 2016 00:05:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

I've been meaning to ask this for quite some time. It appears that Weston's 
DRM compositor enabled with "kms" PACKAGECONFIG doesn't really need the entire 
mesa, but it only needs libgbm. Now, mesa in OE-Core provides libgbm as one of 
its packages, hence virtual/mesa is added in DEPENDS for kms:

PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa mtdev"

On TI platforms with SGX GPU we have GLES/EGL stack (provided by proprietary 
blobs, yeah) and a separate libgbm, based on Rob Clark's https://github.com/robclark/libgbm
Since that is enough to run Weston on our platforms, I've been carrying this 
bbappend for long time:

PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"

It's been working fine for long time, but people keep on asking questions and 
require cleaner solution, since bbappend in a separate layer is somewhat 
confusing. Now, the question is what is a proper solution here:

1. Change weston recipe in oe-core to depend on libgbm instead of virtual/mesa 
assuming that it is provided by mesa recipe and it works for other platforms.

2. Change our libgbm recipe to declare that it PROVIDES virtual/mesa, although 
it looks like a hack and is somewhat reverse...

-- 
Denys

