Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RZ5qp-00062l-II for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:11:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RZ5k8-00041M-Tl for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:04:24 +0100
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 20:04:24 +0100
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 20:04:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Fri, 09 Dec 2011 23:03:05 +0400
Message-ID: <4EE25B69.4090906@gmail.com>
References: <1865303E0DED764181A9D882DEF65FB6E8EDFF05C0@shsmsx502.ccr.corp.intel.com>
	<1323073824.25960.87.camel@ted>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:8.0) Gecko/20111109 Icedove/8.0
In-Reply-To: <1323073824.25960.87.camel@ted>
Subject: Re: meta-toolchain-gmae can't build: Cannot create symlink from ./var/log to 'volatile/log': File exists
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
X-List-Received-Date: Fri, 09 Dec 2011 19:11:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2011 12:30 PM, Richard Purdie wrote:
> On Mon, 2011-12-05 at 15:35 +0800, Cui, Dexuan wrote:
>> Hi, recently, I found meta-toolchain-gmae failed to build on poky master if I use ipk packaging(I didn't try rpm/deb):
>>
>> task do_populate_sdk: Failed
>>
>> | Configuring avahi-dev.
>> | Configuring task-core-standalone-gmae-sdk-target.
>> | Configuring libtelepathy-dbg.
>> | Configuring task-core-standalone-gmae-sdk-target-dbg.
>> | Configuring util-linux-blkid.
>> | Collected errors:
>> |  * extract_archive: Cannot create symlink from ./var/log to 'volatile/log': File exists.
>> ERROR: Function 'do_populate_sdk' failed
>>
>> Now I have no time to look into this issue at once. It would be great, if somebody can give some quick hint.
>
> Is this with the latest master?
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f340e3937fd5ac3963de6c6b29d56dd92d962864
>
> was added to avoid an error very like this that was showing up with
> rpm...

I've stumped upon the very same problem with consolekit. Then I checked 
the contents of the consolekit package:

lumag@fangorn:~/OE-scripts$ dpkg-deb -c 
build/tmp--eglibc/deploy/ipk/core2/consolekit_0.4.5-r7_core2.ipk  | grep var
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/log/
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/log/ConsoleKit/
lrwxrwxrwx root/root         0 2011-12-07 22:12 ./var/run -> volatile/run
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/log/
drwxr-xr-x root/root         0 2011-12-07 22:12 
./var/volatile/log/ConsoleKit/
drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/run/
drwxr-xr-x root/root         0 2011-12-07 22:12 
./var/volatile/run/ConsoleKit/

lumag@fangorn:~/OE-scripts$ ./oebb.sh bitbake -e consolekit | grep 
FILES_consolekit=
# FILES_consolekit=${bindir}/* ${sbindir}/* ${libexecdir}/* 
${libdir}/lib*${SOLIBS} ${sysconfdir} ${sharedstatedir} ${localstatedir} 
${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*${SOLIBS} 
${datadir}/${BPN} ${libdir}/${BPN}/* ${datadir}/pixmaps 
${datadir}/applications ${datadir}/idl ${datadir}/omf ${datadir}/sounds 
${libdir}/bonobo/servers ${datadir}/application-registry 
${datadir}/mime-info 	${datadir}/mime/packages 
${datadir}/mime/application 	${datadir}/gnome-2.0 	${datadir}/polkit* 
${datadir}/GConf 	${datadir}/glib-2.0/schemas  ${datadir}/icons/hicolor 
${localstatedir}/log/ConsoleKit ${libdir}/ConsoleKit ${base_libdir} 
${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*
FILES_consolekit="/usr/bin/* /usr/sbin/* /usr/libexec/* 
/usr/lib/lib*.so.* /etc /com /var /bin/* /sbin/* /lib/*.so.* 
/usr/share/consolekit /usr/lib/consolekit/* /usr/share/pixmaps 
/usr/share/applications /usr/share/idl /usr/share/omf /usr/share/sounds 
/usr/lib/bonobo/servers /usr/share/application-registry 
/usr/share/mime-info 	/usr/share/mime/packages 
/usr/share/mime/application 	/usr/share/gnome-2.0 	/usr/share/polkit* 
/usr/share/GConf 	/usr/share/glib-2.0/schemas  /usr/share/icons/hicolor 
/var/log/ConsoleKit /usr/lib/ConsoleKit /lib /usr/share/dbus-1 
/usr/share/PolicyKit /usr/share/polkit*"

Not that this already includes /var, then /var/log/ConsoleKit is added. 
I'm more or less sure that original inclusion of 
${localstatedir}/log/ConsoleKit was en error.

>
> Cheers,
>
> Richard


-- 
With best wishes
Dmitry



