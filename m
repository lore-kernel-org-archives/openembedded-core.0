Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SwUHF-0000St-2z
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 10:27:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Aug 2012 01:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="200827851"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2012 01:15:53 -0700
Message-ID: <5018E623.5090502@intel.com>
Date: Wed, 01 Aug 2012 11:17:39 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20120731110242.D424910219@opal>
	<20120731132257.GW3261@jama.jama.net>
In-Reply-To: <20120731132257.GW3261@jama.jama.net>
Subject: Re: [oe-commits] Radu Moisan : dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Wed, 01 Aug 2012 08:27:33 -0000
Content-Type: multipart/alternative;
	boundary="------------080604020108070505080104"

--------------080604020108070505080104
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Could not get rid of PREFERRED_PROVIDER warning. Tried different 
variations but the warning remains there every time. Can you give me 
some hint about PREFERRED_PROVIDER usage?

Thanks,
Radu

On 07/31/2012 04:22 PM, Martin Jansa wrote:
> On Tue, Jul 31, 2012 at 11:02:42AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: c02364f36e228835ea5d7fd4e1d347fd451f8544
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=c02364f36e228835ea5d7fd4e1d347fd451f8544
>>
>> Author: Radu Moisan <radu.moisan@intel.com>
>> Date:   Tue Jul 31 09:23:23 2012 +0300
>>
>> dbus: include dbus-launch in the main dbus package
>>
>> Followed suggestions from Bugz 2261:
>>
>> 2) make the virtual/libx11 DEPENDS conditional based on the x11 distro feature.
>> This makes the build dependencies reflect the feature list.
>>
>> 3) remove dbus-x11, meaning that dbus-launch with its potential X11 dependency
>> is now back in dbus where is belongs.
>>
>> 4) make dbus provide dbus-x11, for compatibility.
> 5) create new warning:
> NOTE: multiple providers are available for runtime dbus-x11 (dbus, dbus-nativesdk)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match dbus-x11
>
> Cheers,
>
>> Fixes [Yocto #2261]
>>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   meta/recipes-core/dbus/dbus.inc |   10 ++++++----
>>   1 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
>> index a75583d..164c4d3 100644
>> --- a/meta/recipes-core/dbus/dbus.inc
>> +++ b/meta/recipes-core/dbus/dbus.inc
>> @@ -31,10 +31,11 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
>>   
>>   DEBIANNAME_${PN} = "dbus-1"
>>   
>> -PACKAGES =+ "${PN}-lib ${PN}-systemd ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}"
>> +PACKAGES =+ "${PN}-lib ${PN}-systemd"
>>   
>> -FILES_${PN}-x11 = "${bindir}/dbus-launch"
>> -RDEPENDS_${PN}-x11 = "${PN}"
>> +# for compatibility
>> +RPROVIDES_${PN} = "dbus-x11"
>> +RREPLACES_${PN} += "dbus-x11"
>>   
>>   FILES_${PN}-systemd = "${systemd_unitdir}/system/"
>>   
>> @@ -43,6 +44,7 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
>>                  ${bindir}/dbus-cleanup-sockets \
>>                  ${bindir}/dbus-send \
>>                  ${bindir}/dbus-monitor \
>> +               ${bindir}/dbus-launch \
>>                  ${libexecdir}/dbus* \
>>                  ${sysconfdir} \
>>                  ${localstatedir} \
>> @@ -59,7 +61,7 @@ pkg_postinst_dbus() {
>>   }
>>   
>>   EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
>> -EXTRA_OECONF_X_virtclass-native = "--without-x"
>> +EXTRA_OECONF_X_virtclass-native = "--disable-x11-autolaunch"
>>   
>>   EXTRA_OECONF = "--disable-tests \
>>                   --disable-checks \
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------080604020108070505080104
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Could not get rid of PREFERRED_PROVIDER warning. Tried different
    variations but the warning remains there every time. Can you give me
    some hint about PREFERRED_PROVIDER usage?<br>
    <br>
    Thanks,<br>
    Radu<br>
    <br>
    <div class="moz-cite-prefix">On 07/31/2012 04:22 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote cite="mid:20120731132257.GW3261@jama.jama.net"
      type="cite">
      <pre wrap="">On Tue, Jul 31, 2012 at 11:02:42AM +0000, <a class="moz-txt-link-abbreviated" href="mailto:git@git.openembedded.org">git@git.openembedded.org</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Module: openembedded-core.git
Branch: master
Commit: c02364f36e228835ea5d7fd4e1d347fd451f8544
URL:    <a class="moz-txt-link-freetext" href="http://git.openembedded.org/?p=openembedded-core.git&amp;a=commit;h=c02364f36e228835ea5d7fd4e1d347fd451f8544">http://git.openembedded.org/?p=openembedded-core.git&amp;a=commit;h=c02364f36e228835ea5d7fd4e1d347fd451f8544</a>

Author: Radu Moisan <a class="moz-txt-link-rfc2396E" href="mailto:radu.moisan@intel.com">&lt;radu.moisan@intel.com&gt;</a>
Date:   Tue Jul 31 09:23:23 2012 +0300

dbus: include dbus-launch in the main dbus package

Followed suggestions from Bugz 2261:

2) make the virtual/libx11 DEPENDS conditional based on the x11 distro feature.
This makes the build dependencies reflect the feature list.

3) remove dbus-x11, meaning that dbus-launch with its potential X11 dependency
is now back in dbus where is belongs.

4) make dbus provide dbus-x11, for compatibility.
</pre>
      </blockquote>
      <pre wrap="">
5) create new warning:
NOTE: multiple providers are available for runtime dbus-x11 (dbus, dbus-nativesdk)
NOTE: consider defining a PREFERRED_PROVIDER entry to match dbus-x11

Cheers,

</pre>
      <blockquote type="cite">
        <pre wrap="">
Fixes [Yocto #2261]

Signed-off-by: Radu Moisan <a class="moz-txt-link-rfc2396E" href="mailto:radu.moisan@intel.com">&lt;radu.moisan@intel.com&gt;</a>
Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>

---

 meta/recipes-core/dbus/dbus.inc |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index a75583d..164c4d3 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -31,10 +31,11 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib ${PN}-systemd ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}"
+PACKAGES =+ "${PN}-lib ${PN}-systemd"
 
-FILES_${PN}-x11 = "${bindir}/dbus-launch"
-RDEPENDS_${PN}-x11 = "${PN}"
+# for compatibility
+RPROVIDES_${PN} = "dbus-x11"
+RREPLACES_${PN} += "dbus-x11"
 
 FILES_${PN}-systemd = "${systemd_unitdir}/system/"
 
@@ -43,6 +44,7 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-cleanup-sockets \
                ${bindir}/dbus-send \
                ${bindir}/dbus-monitor \
+               ${bindir}/dbus-launch \
                ${libexecdir}/dbus* \
                ${sysconfdir} \
                ${localstatedir} \
@@ -59,7 +61,7 @@ pkg_postinst_dbus() {
 }
 
 EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-EXTRA_OECONF_X_virtclass-native = "--without-x"
+EXTRA_OECONF_X_virtclass-native = "--disable-x11-autolaunch"
 
 EXTRA_OECONF = "--disable-tests \
                 --disable-checks \


_______________________________________________
Openembedded-commits mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-commits@lists.openembedded.org">Openembedded-commits@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------080604020108070505080104--
