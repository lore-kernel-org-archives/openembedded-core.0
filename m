Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UN1di-000613-HV
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 15:52:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Apr 2013 06:33:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,393,1363158000"; d="scan'208";a="288217131"
Received: from dell-desktop.rb.intel.com (HELO [10.237.105.59])
	([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 02 Apr 2013 06:35:30 -0700
Message-ID: <515ADEA3.5030800@intel.com>
Date: Tue, 02 Apr 2013 16:35:31 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
In-Reply-To: <CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 13:52:45 -0000
X-List-Received-Date: Tue, 02 Apr 2013 13:52:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 04/02/2013 04:02 PM, Samuel Stirtzel wrote:
> 2013/4/2 Radu Moisan <radu.moisan@intel.com>:
>> This fixes a service dependency issue;
>> While graphical.target is the default mode, systemd
>> will try to start display-manager.service which is not
>> available.
>>
>> For xserver-nodm-init we would then have something like:
>> inherit update-alternatives
>> ALTERNATIVE_${PN} = "systemd-def-target"
>> ALTERNATIVE_TARGET[systemd-def-target] = "${systemd_unitdir}/system/graphical.target"
>> ALTERNATIVE_LINK_NAME[systemd-def-target] = "${systemd_unitdir}/system/default.target"
>> ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"
>>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> ---
>>   meta/recipes-core/systemd/systemd_199.bb |    2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
>> index ba1d133..bf1eb39 100644
>> --- a/meta/recipes-core/systemd/systemd_199.bb
>> +++ b/meta/recipes-core/systemd/systemd_199.bb
>> @@ -248,6 +248,7 @@ update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl
>>   update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
>>   update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
>>   update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
>> +update-alternatives --install ${systemd_unitdir}/system/default.target systemd-def-target ${systemd_unitdir}/system/multi-user.target 1
>>   }
>>
>>   pkg_prerm_systemd () {
>> @@ -256,6 +257,7 @@ update-alternatives --remove halt ${base_bindir}/systemctl
>>   update-alternatives --remove reboot ${base_bindir}/systemctl
>>   update-alternatives --remove shutdown ${base_bindir}/systemctl
>>   update-alternatives --remove poweroff ${base_bindir}/systemctl
>> +update-alternatives --remove systemd-def-target ${systemd_unitdir}/system/multi-user.target
>>   }
>>
>>   pkg_postinst_udev-hwdb () {
>> --
>> 1.7.9.5
>>
> Reliving a dejavu?
>
> This was already rejected before see [1], hope you remember this.
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-January/034806.html
It was not rejected, have you seen a nack from Ross? Actually I just 
checked a few days ago with Ross and the reason it didn't merge was 
because it didn't apply anymore. And because systemd upgrade to v199 was 
pending I waited for that one to get pulled in. So now with systemd_199 
in, here is my rebased v3 as well.

There is a bug filled for this problem Bug#3816, do you have a better 
solution in mind?

Radu


