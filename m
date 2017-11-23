Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6653A782A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 10:20:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vANAK72a017441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 23 Nov 2017 10:20:09 GMT
Message-ID: <1511432407.862.111.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org, Armin Kuster
	<akuster808@gmail.com>, "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>,
	"Xu, Chi" <Chi.Xu@windriver.com>, "Yang,
	Liezhi" <Liezhi.Yang@windriver.com>, "WOLD, SAUL" <saul.wold@intel.com>
Date: Thu, 23 Nov 2017 10:20:07 +0000
In-Reply-To: <45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com>
	<45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNDfigJkxNw==?=
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
X-List-Received-Date: Thu, 23 Nov 2017 10:20:18 -0000
X-Groupsio-MsgNum: 105452
Content-Type: multipart/mixed; boundary="=-HiKavBMyZUOzG+0T4M7E"

--=-HiKavBMyZUOzG+0T4M7E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-11-20 at 20:22 -0500, Randy MacLeod wrote:
> > o   Issues with 4.13.10 host kernels booting kvm x86 guests on
> > Tumbleweed (Suse) and Fedora 26 (attempting to see if 4.13.12
> > helps)
>  
> Robert, can you test Fedora 26. It would help to have a defect open
> with steps to reproduce or
> something about the typical workflow/ build time/ day of the week/
> phase of the moon. 

We have some further data:

a) The issue occurs on 4.13.12

rpurdie@tumbleweed:/tmp> cat /proc/version 
Linux version 4.13.12-1-vanilla (geeko@buildhost) (gcc version 7.2.1 20171020 [gcc-7-branch revision 253932] (SUSE Linux)) #1 SMP PREEMPT Wed Nov 8 11:21:09 UTC 2017 (9151c66)

b) The hang usually occurs at the TIMER line in the kernel logs but can
occur after booting into userspace around the udevd line, or
occasionally later in the boot process.

c) The similarity between this and the ppc bug I worked on make me
strongly suspect qemu's timers are stopping firing and the guest is
sitting in the idle loop.

d) I do now have a way to brute force the hangs at will. The attached
"runqemu-parallel.py" script runs 50 qemus in parallel. In around 45s I
had 10 hung on the autobuilder. I can provide more info on using that
script if its not obvious. It does assume my recent master changes to
the qemuconf files so we don't need to run bitbake -e to run runqemu.

This could well be the same kind of locking issue we saw on ppc. I'll
continue to look into that.

Hopefully this extra information will put us on a good track to
resolving it now. It is continuing to break builds and stop patch
merging.

Cheers,

Richard

--=-HiKavBMyZUOzG+0T4M7E
Content-Disposition: attachment; filename="runqemu-parallel.py"
Content-Type: text/x-python; name="runqemu-parallel.py"; charset="UTF-8"
Content-Transfer-Encoding: base64

IyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwoKaW1wb3J0IHNodXRpbAppbXBvcnQgdGltZQppbXBvcnQg
c3VicHJvY2VzcwppbXBvcnQgb3MKCnByb2NzID0gbGlzdChyYW5nZSgxLCA1MCkpCgpsb2dzID0g
Ii90bXAvcnVucWVtdS1sb2ciCmVycmxvZ3MgPSAiL3RtcC96cnVucWVtdS1sb2ciCmxvZ2ZkcyA9
IHt9CmVycmxvZ2ZkcyA9IHt9CnByb2Nlc3NlcyA9IHt9CmltYWdlID0gIi9tZWRpYS9idWlsZDEv
cG9reS9idWlsZC90bXAtbXVzbC9kZXBsb3kvaW1hZ2VzL3FlbXVwcGMvY29yZS1pbWFnZS1zYXRv
LXFlbXVwcGMucWVtdWJvb3QuY29uZiIKa2VybmVsID0gInRtcC1tdXNsL2RlcGxveS9pbWFnZXMv
cWVtdXBwYy92bWxpbnV4LXFlbXVwcGMuYmluIgptYWNoaW5lID0gInFlbXVwcGMiCgppbWFnZSA9
ICIvbWVkaWEvYnVpbGQxL3Bva3kvYnVpbGQvdG1wLW11c2wvZGVwbG95L2ltYWdlcy9xZW11eDg2
LTY0L2NvcmUtaW1hZ2Utc2F0by1xZW11eDg2LTY0LnFlbXVib290LmNvbmYiCmtlcm5lbCA9ICJ0
bXAtbXVzbC9kZXBsb3kvaW1hZ2VzL3FlbXV4ODYtNjQvYnpJbWFnZS1xZW11eDg2LTY0LmJpbiIK
bWFjaGluZSA9ICJxZW11eDg2LTY0IgoKZW52ID0gb3MuZW52aXJvbi5jb3B5KCkKZW52WydNQUNI
SU5FJ10gPSBtYWNoaW5lCgpkZWYgc3RhcnQocCk6CiAgICBsb2dmZHNbcF0gPSBvcGVuKGxvZ3Mg
KyAiLiVkIiAlIHAsICJ3IikKICAgIGVycmxvZ2Zkc1twXSA9IG9wZW4oZXJybG9ncyArICIuJWQi
ICUgcCwgInciKQogICAgI2RlYnVnb3B0cyA9ICItZCB1bmltcCxndWVzdF9lcnJvcnMsaW50LG91
dF9hc20sb3Asb3Bfb3B0LG9wX2luZCxtbXUscGNhbGwsY3B1X3Jlc2V0LG5vY2hhaW4iCiAgICAj
ZXhlYyxjcHUsaW5fYXNtLAogICAgZGVidWdvcHRzID0gIi1kIHVuaW1wLGd1ZXN0X2Vycm9ycyxp
bnQiCiAgICBkZWJ1Z29wdHMgKz0gIiAtRCAvdG1wL3FlbXUuJWQgLW1vbml0b3IgcHR5IiAlIHAK
ICAgIHByb2Nlc3Nlc1twXSA9IHN1YnByb2Nlc3MuUG9wZW4oWyJydW5xZW11IixtYWNoaW5lLCJu
b2dyYXBoaWMiLCAic25hcHNob3QiLCAia3ZtIiwga2VybmVsLCBpbWFnZSwgInFlbXVwYXJhbXM9
LXBpZGZpbGUgL3RtcC96enFlbXUuJWQucGlkICVzIiAlIChwLCBkZWJ1Z29wdHMpXSwgc3Rkb3V0
PWxvZ2Zkc1twXSwgc3RkZXJyPWVycmxvZ2Zkc1twXSwgZW52PWVudikKICAgIHByaW50KCJTdGFy
dGVkICVkIiAlIHApCgpmb3IgcCBpbiBwcm9jczoKICAgIHN0YXJ0KHApCgpsYXN0c2l6ZSA9IHt9
Cgp3aGlsZSBwcm9jczoKICAgIHNpemVzID0ge30KICAgIHRpbWUuc2xlZXAoMC41KQoKICAgIGZv
ciBwIGluIHByb2NzOgogICAgICAgIGxvZ2ZpbGUgPSBsb2dzICsgIi4lZCIgJSBwCiAgICAgICAg
cGlkZm4gPSAiL3RtcC96enFlbXUuJWQucGlkIiAlIHAKICAgICAgICB3aXRoIG9wZW4obG9nZmls
ZSwgInIiKSBhcyBsZjoKICAgICAgICAgICAgZm9yIGwgaW4gbGY6CiAgICAgICAgICAgICAgICBp
ZiAibG9naW46IiBpbiBsOgogICAgICAgICAgICAgICAgICAgIHdpdGggb3BlbihwaWRmbikgYXMg
cGlkZmlsZToKICAgICAgICAgICAgICAgICAgICAgICAgcGlkID0gaW50KHBpZGZpbGUucmVhZGxp
bmUoKS5zdHJpcCgpKQogICAgICAgICAgICAgICAgICAgIHByaW50KCJLaWxsaW5nICVkIHdpdGgg
cGlkICVkIiAlIChwLCBwaWQpKQogICAgICAgICAgICAgICAgICAgIG9zLmtpbGwocGlkLCA5KQog
ICAgICAgICAgICAgICAgICAgIHByb2NzLnJlbW92ZShwKQogICAgICAgICAgICAgICAgICAgIGlm
IHAgaW4gbGFzdHNpemU6CiAgICAgICAgICAgICAgICAgICAgICAgIGRlbCBsYXN0c2l6ZVtwXQog
ICAgICAgICAgICAgICAgICAgIHRpbWUuc2xlZXAoMC4xKQogICAgICAgICAgICAgICAgICAgIGxv
Z2Zkc1twXS5jbG9zZSgpCiAgICAgICAgICAgICAgICAgICAgZXJybG9nZmRzW3BdLmNsb3NlKCkK
ICAgICAgICAgICAgICAgICAgICBzdGFydChwKQogICAgICAgICAgICAgICAgICAgIHByb2NzLmFw
cGVuZChwKQogICAgICAgIHNpemVzW3BdID0gb3Muc3RhdChsb2dmaWxlKS5zdF9zaXplCiAgICAg
ICAgaWYgcCBpbiBsYXN0c2l6ZSBhbmQgc2l6ZXNbcF06CiAgICAgICAgICAgaWYgbm90IHNpemVz
W3BdID4gbGFzdHNpemVbcF06CiAgICAgICAgICAgICAgIHByaW50KCIlZCBzdGFsbGVkPyIgJSBw
KQogICAgbGFzdHNpemUgPSBzaXplcwoK

--=-HiKavBMyZUOzG+0T4M7E--
