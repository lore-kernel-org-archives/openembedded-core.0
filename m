Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RLM5q-0002OH-6Z
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 22:42:02 +0100
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 01 Nov 2011 14:35:53 -0700
Received: by faan26 with SMTP id n26so7283972faa.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 14:35:52 -0700 (PDT)
Received: by 10.223.91.82 with SMTP id l18mr167126fam.30.1320183352221;
	Tue, 01 Nov 2011 14:35:52 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id r7sm1166089faa.3.2011.11.01.14.35.50
	(version=SSLv3 cipher=OTHER); Tue, 01 Nov 2011 14:35:51 -0700 (PDT)
Message-ID: <4EB06634.6090204@intel.com>
Date: Tue, 01 Nov 2011 14:35:48 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320182590.git.sgw@linux.intel.com>
	<43df49f1967ebd4e5a956c601c9865f67598d52f.1320182590.git.sgw@linux.intel.com>
	<20111101213059.GB9949@jama.jama.net>
In-Reply-To: <20111101213059.GB9949@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 2/4] xserver-nodm-init: Add xuser (hardcoded)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2011 21:42:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2011 02:30 PM, Martin Jansa wrote:
> On Tue, Nov 01, 2011 at 02:27:17PM -0700, Saul Wold wrote:
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   .../x11-common/xserver-nodm-init.bb                |   30 +++++++------------
>>   1 files changed, 11 insertions(+), 19 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
>> index ea4222d..1183f0e 100644
>> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
>> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION = "Simple Xserver Init Script (no dm)"
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>>   SECTION = "x11"
>> -PR = "r26"
>> +PR = "r28"
>>   RDEPENDS_${PN} = "sudo"
>>
>>   SRC_URI = "file://xserver-nodm \
>> @@ -19,27 +19,19 @@ do_install() {
>>       install xserver-nodm ${D}/etc/init.d
>>       if [ "${ROOTLESS_X}" = "1" ] ; then
>>           install -d ${D}/etc/X11
>> -        install Xusername ${D}/etc/X11
>> +	install Xusername ${D}/etc/X11
>>       fi
>>   }
>>
>> -pkg_postinst_${PN} () {
>> -    if [ "x$D" != "x" ] ; then
>> -        exit 1
>> -    fi
>> -
>> -    if [ -f /etc/X11/Xusername ]; then
>> -        # create the rootless X user, and add user to group tty, video, audio
>> -        username=`cat /etc/X11/Xusername`
>> -        adduser --disabled-password $username
>> -        # FIXME: use addgroup if busybox addgroup is ready
>> -        sed -i -e "s/^video:.*/&${username}/g" /etc/group
>> -        sed -i -e "s/^tty:.*/&${username}/g" /etc/group
>> -        sed -i -e "s/^audio:.*/&${username}/g" /etc/group
>> -    fi
>> -}
>> -
>> -inherit update-rc.d
>> +inherit update-rc.d useradd
>>
>>   INITSCRIPT_NAME = "xserver-nodm"
>>   INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
>> +
>> +# Use fixed Xusername of xuser for now, this will need to be
>> +# fixed if the Xusername changes from xuser
>> +USERADD_PACKAGES = "${PN}"
>> +USERADD_PARAM_${PN} = "--system --no-create-home \
>> +                       --shell /bin/false --groups video,tty,audioi \
>
> audioi?
>
> I guess you're also using vim :)
i
good catch (fixed in the branch)
:w
:q
:-)

Sau!

>
> Cheers,
>
>> +                       --user-group xuser"
>> +
>> --
>> 1.7.6.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



