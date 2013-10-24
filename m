Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4CACC6D319;
	Thu, 24 Oct 2013 10:18:03 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VZHzQ-0003wp-Pj from Muhammad_Shakeel@mentor.com ;
	Thu, 24 Oct 2013 03:18:04 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 24 Oct 2013 03:18:04 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Thu, 24 Oct 2013 11:18:00 +0100
Message-ID: <5268F419.2000805@mentor.com>
Date: Thu, 24 Oct 2013 15:19:05 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20130910220329.45CB15043D@opal> <20131002231105.GA6240@jama>
	<20131018102205.GH3930@jama>
In-Reply-To: <20131018102205.GH3930@jama>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 24 Oct 2013 10:18:04.0524 (UTC)
	FILETIME=[538B4AC0:01CED0A2]
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Muhammad Shakeel : openssh: Add systemd support
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
X-List-Received-Date: Thu, 24 Oct 2013 10:18:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2013 03:22 PM, Martin Jansa wrote:
> On Thu, Oct 03, 2013 at 01:11:05AM +0200, Martin Jansa wrote:
>> On Tue, Sep 10, 2013 at 10:03:29PM +0000, git@git.openembedded.org wrote:
>>> Module: openembedded-core.git
>>> Branch: master
>>> Commit: 6e6445d487c033913a29763f8e3a7a339d5b612d
>>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=6e6445d487c033913a29763f8e3a7a339d5b612d
>>>
>>> Author: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>>> Date:   Wed Sep  4 11:04:59 2013 +0000
>>>
>>> openssh: Add systemd support
>>>
>>> -Remove dependency on meta-systemd
>>>
>>> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>
>>> ---
>>>
>>>   .../openssh/openssh-6.2p2/sshd.socket              |   11 +++++++++++
>>>   .../openssh/openssh-6.2p2/sshd@.service            |    9 +++++++++
>>>   .../openssh/openssh-6.2p2/sshdgenkeys.service      |   10 ++++++++++
>>>   meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   19 +++++++++++++++++--
>>>   4 files changed, 47 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
>>> index c76f9ac..3a7f50d 100644
>>> --- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
>>> +++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
>>> @@ -26,14 +26,17 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>>>              file://init \
>>>              file://openssh-CVE-2011-4327.patch \
>>>              file://mac.patch \
>>> -           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
>>> +           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
>>> +           file://sshd.socket \
>>> +           file://sshd@.service \
>>> +           file://sshdgenkeys.service "
>>>   
>>>   PAM_SRC_URI = "file://sshd"
>>>   
>>>   SRC_URI[md5sum] = "be46174dcbb77ebb4ea88ef140685de1"
>>>   SRC_URI[sha256sum] = "7f29b9d2ad672ae0f9e1dcbff871fc5c2e60a194e90c766432e32161b842313b"
>>>   
>>> -inherit useradd update-rc.d update-alternatives
>>> +inherit useradd update-rc.d update-alternatives systemd
>>>   
>>>   USERADD_PACKAGES = "${PN}-sshd"
>>>   USERADD_PARAM_${PN}-sshd = "--system --no-create-home --home-dir /var/run/sshd --shell /bin/false --user-group sshd"
>>> @@ -41,6 +44,9 @@ INITSCRIPT_PACKAGES = "${PN}-sshd"
>>>   INITSCRIPT_NAME_${PN}-sshd = "sshd"
>>>   INITSCRIPT_PARAMS_${PN}-sshd = "defaults 9"
>>>   
>>> +SYSTEMD_PACKAGES = "${PN}-sshd"
>>> +SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket sshd@.service sshdgenkeys.service"
>> Is it correct to use sshd@.service here?
>>
>> meta-systemd .bbappend had only sshd.socket:
>> -SYSTEMD_PACKAGES = "${PN}-sshd"
>> -SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
(Sorry for not replying earlier, your message was moved into a filtered dir)

sshd.service was running a single SSH server for all incoming 
connections, suitable only for systems with a large amount of SSH 
traffic. In almost all other cases it is a better idea to use 
sshd.socket + sshd@.service (i.e. the on-demand spawning version for one 
instance per connection).

sshd@.service should not be start/restart by systemctl by postinst and 
to achieve this, IMO, it should be removed from SYSTEMD_SERVICE_${PN}-sshd.
>> (re)starting sshd@service from postinst is failing with:
>> SHR root@pjama /etc $ bash -x /var/lib/opkg/info/openssh-sshd.postinst
>> + OPTS=
>> + '[' -n '' ']'
>> + type systemctl
>> + systemctl enable sshd.socket sshd@.service sshdgenkeys.service
>> + '[' -z '' -a enable = enable ']'
>> + systemctl restart sshd.socket sshd@.service sshdgenkeys.service
>> Failed to issue method call: Unit name sshd@.service is not valid.
> ping
>


