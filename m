Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 04C206067C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 09:40:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 0F27B264CCB
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1449737824.git.joshua.lock@collabora.co.uk>
	<accfe2aa0774602538c6a37d3ceb442547576fa5.1449737824.git.joshua.lock@collabora.co.uk>
	<20151210093012.GG2246@jama>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <56694871.7090406@collabora.co.uk>
Date: Thu, 10 Dec 2015 09:40:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20151210093012.GG2246@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 3/3] connman-conf: convert to an allarch package
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
X-List-Received-Date: Thu, 10 Dec 2015 09:40:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/15 09:30, Martin Jansa wrote:
> On Thu, Dec 10, 2015 at 09:01:43AM +0000, Joshua Lock wrote:
>> This recipe just installs some data files and a script and isn't machine or
>> architecture specific. Even though it was designed to be used only for qemu
>> machines there's no reason it can't be used elsewhere.
>
> Sorry if I wasn't clear before.
>
> I think it was better as machine specific.
>
> We're using it in our layers to provide static configuration for connman
> and that's often MACHINE specific (even the qemu config sets MAC which
> you probably don't want to use the same across all MACHINEs built with
> OE).

Ah, it wasn't clear that you were making use of this recipe and I had 
also completely missed that it sets the MAC address. You are of course 
right, this should probably stay MACHINE specific.

All I really care about is not having

"connman.service: Failed at step EXEC spawning 
/usr/lib/connman/wired-setup: No such file or directory"

in the journal all the time, 1/3 and 2/3 should resolve this so I will 
just drop 3/3.

> That's the reason why this recipe is in SIGGEN_EXCLUDERECIPES_ABISAFE.
>
> This change also sets this static configuration for all builds, is
> current wired.config really suitable for all devices? I don't think so.

All builds which include connman-conf. Which with the change to 
RRECOMMENDS_qemuall in 2/3 by default is only builds for qemu builds, right?

>
>> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
>> ---
>>   meta/recipes-connectivity/connman/connman-conf.bb              | 10 ++++------
>>   .../connman-conf/{qemuall => }/wired-connection.service        |  0
>>   .../connman/connman-conf/{qemuall => }/wired-setup             |  0
>>   .../connman/connman-conf/{qemuall => }/wired.config            |  0
>>   4 files changed, 4 insertions(+), 6 deletions(-)
>>   rename meta/recipes-connectivity/connman/connman-conf/{qemuall => }/wired-connection.service (100%)
>>   rename meta/recipes-connectivity/connman/connman-conf/{qemuall => }/wired-setup (100%)
>>   rename meta/recipes-connectivity/connman/connman-conf/{qemuall => }/wired.config (100%)
>>
>> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
>> index bef9237..a8fdb8c 100644
>> --- a/meta/recipes-connectivity/connman/connman-conf.bb
>> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
>> @@ -4,18 +4,16 @@ network interface for a qemu machine."
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
>>
>> -inherit systemd
>> +inherit systemd allarch
>>
>> -SRC_URI_append_qemuall = " file://wired.config \
>> -                           file://wired-setup \
>> -                           file://wired-connection.service \
>> +SRC_URI = "file://wired.config \
>> +           file://wired-setup \
>> +           file://wired-connection.service \
>>   "
>>   PR = "r2"
>>
>>   S = "${WORKDIR}"
>>
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>>   FILES_${PN} = "${localstatedir}/* ${datadir}/*"
>>
>>   do_install() {
>> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service b/meta/recipes-connectivity/connman/connman-conf/wired-connection.service
>> similarity index 100%
>> rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service
>> rename to meta/recipes-connectivity/connman/connman-conf/wired-connection.service
>> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup b/meta/recipes-connectivity/connman/connman-conf/wired-setup
>> similarity index 100%
>> rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
>> rename to meta/recipes-connectivity/connman/connman-conf/wired-setup
>> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config b/meta/recipes-connectivity/connman/connman-conf/wired.config
>> similarity index 100%
>> rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config
>> rename to meta/recipes-connectivity/connman/connman-conf/wired.config
>> --
>> 2.5.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


