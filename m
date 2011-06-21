Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QYvXJ-00009I-6M
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 09:38:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5L7YcNt012848
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Jun 2011 00:34:38 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 21 Jun 2011 00:34:38 -0700
Message-ID: <4E0049AE.7050609@windriver.com>
Date: Tue, 21 Jun 2011 15:35:10 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <4DF0A70C.7080501@windriver.com> <4DF0E4A8.1000608@windriver.com>
	<4DFB26CE.7070807@windriver.com> <4DFB76E3.5090606@windriver.com>
In-Reply-To: <4DFB76E3.5090606@windriver.com>
X-Originating-IP: [128.224.162.154]
Cc: Robert, "poky@yoctoproject.org" <poky@yoctoproject.org>, Patches,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: Question about apply eglibc configurability to create minimal image
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
X-List-Received-Date: Tue, 21 Jun 2011 07:38:13 -0000
X-Groupsio-MsgNum: 4404
Content-Type: multipart/mixed; boundary="------------020001090403000305020002"

--------------020001090403000305020002
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


>> Hi Mark,
>>
>> According this list, expand with their run time depency(show in the attachment
>> minimal-image-runtime-dependies.png) , and the list is:
>>
>>      base-files \
>>      base-passwd \
>>      busybox \
>>      busybox-syslog \
>>      busybox-udhcpc \
>>      initscripts \
>>      makedevs \
>>      modutils-initscripts \
>>      sysvinit \
>>      sysvinit-pidof \
>>      sysvinit-inittab \
>>      tinylogin
>>
>>
>> When only enable eglibc libm, busybox, sysvinit and tinylogin can't be compiled.
>>
>> busybox depends on
>>
>>      * libc-crypt
>>      * libc-getlogin
>>      * libc-inet
>>      * libc-posix-regexp
>>
>> I wonder that maybe libc-crypt can NOT be disabled?  Other 3 options can be
>> disabled by closing some busybox feature and builtin commands.

Hi Mark,

> I would guess that there are options within busybox that are enabled that make
> use of each of these.  Do you get a failure in compilation, configuration, or?
> You will likely have to shrink busybox down to a shell and a few simple
> commands, instead of the normal config.

libm and libcrypt are added to LDLIBS unconditionally in Makefile.flags 
in busybox source code. I am trying to figure out why add them 
unconditionally. With these 2 options enabled and patch for busybox's 
defconf in attachment, I make the busybox compile succeed.

In the patch all the internet related features are disabled and some 
command such as awk, sed, grep(re support), mount( nfs feature), expr, 
logname, who, find, syslogd(remote log), rdate are removed or disabled .

>> sysvinit depends on
>>
>>      * libc-inet
>>      * libc-sunrpc
>>      * libc-crypt
>>
>> I don't how to resolve them, so as you said, remove it and use busybox init instead.
> Ya, busybox init should use fewer items.  If busybox init can't be used, then
> simply using the busybox shell as the init will likely work for a truly minimal
> system.

busybox init could be used, and mdev is also used to replace udev.

>> tinylogin depends on
>>
>>      * libc-crypt
>>      * libc-utmp
>>      * libc-getlogin
>>
>> I am trapped here, and could you give me some more help here, please?
> Ok, that makes sense.  Guess you need to remove tinylogin as well.  Since simply
> offering login services would require those three items.

tinylogin is removed.

>> The picture named eglibc-options-deps-for-minimal-image.png in attachment is the
>> packages depends on every eglibc option that required by other packages.
>>
>> There are some other dependencies cause problems.
>> linux-yocto requires elfutils python and perl.
> We need to figure out why linux-yocto requires these items.  (I suspect it's for
> perf or similar.  If thats the case, then this is likely a bug.  Perf should
> have to be built for each kernel, if the required capabilities don't exist.)

Yes, perf runtime depends on elfutils,  python and perl, and perf also 
need elfutils to provide libelf for its compilation.

I remove the perl and python in linux-tools.inc file, but keep the 
elfutils. After that remove elfutils' dependency gettext, and add
EXTRA_OEMAKE = "-C libelf"
to build libelf only(because other subdirectories requires libc-ftraverse).

>> elfutils requires gettext and gettext depends on:
>>
>>      * libc-locale-code
>>      * libc-spawn
>>      * libc-getlogin
> I think we have to assume that elfutils is not needed.  It's better to break
> that dependency instead of trying to fix it.
>
>> python requires ncurses and openssl.
>>
>>      * ncurses could be update bb file to choose support wchar or not.
>>      * openssl depends on:
>>            o libc-inet
>>            o libc-nsswitch
> I really wonder if there is something inside of openssl we can disable -- or if
> there is a switch to python that disables SSL support...  It might be worth
> investigating changing the python configuration.
>
>> perl depends on:
>>
>>      * libc-crypt
>>      * libc-fcvt
>>      * libc-inet
>>      * libc-utmp
> Similarly it might be worth investigating in perl if we can disable the users of
> these functions in a similar way.
>
>> How to remove these dependencies?  One way is to remove the "elfutils python
>> perl" from linux-yocto depencies, and the other is to disable related features
>> of these packages, and I wonder this is too hard to finish.
> I'd suggest, for now, simply to remove the elfutils, python and perl
> dependencies from the linux-yocto to continue.
>
> The goal of this exercise is simply to see how small of a eglibc system can be
> produced that will boot.  Then figure out how to scale up from there.  (I assume
> once we get beyond a few basic apps that we will need much of eglibc!)
>
> Based on your research above, I would suggest:
>
> * File a bug on the linux-yocto requiring elfutils, python and perl
>
> * Get rid of sysvinit and tinylogin.
>
> * Figure out if you can change the selections on busybox to still build
> something with a shell, but very little additional functionality with the
> minimal eglibc configuration.

With sysvinit and tinylogin removed and busybox configured by patch in 
the attachment, and keep 3 eglibc options (libc-libm libc-crypt 
libc-posix-regexp), the size of image rootfs after extraction is *2.9M* 
for ppc. busybox is 432K after extraction and maybe remove 
libc-posix-regexp will decrease the size of it. I'll try to do that.

libc-posix-regexp is required by perf.

> * Assuming that's possible... start adding in the additional functionality,
> crypt, inet, getlogin, utmp and get back to that standard busybox configuration
> and tinylogin.

After get "libc-sunrpc libc-utmp libc-inet libc-nsswitch libc-getlogin" 
back, after add tinylogin and standard busybox, I get the size after 
extraction is *3.5M*.

> This should give us a good size comparison between.  Non-internet connected,
> minimal system..  and something that could be connected to the internet.
>
> (Note, I don't think anyone will really build such a minimal system in the
> real-world.  However the size and configuration information could be useful for
> someone trying to squeeze this into a small system.  It might turn out that
> uClibc is still more practical for such systems.)

I wonder how can I record my current work that other people can take 
advantage of it? For now I modify task-core-boot directly, but it seems  
unacceptable because other image also include task-core-boot. Should I 
add a new task-core-boot-minimal only include

     base-files \
     base-passwd \
     busybox \
     initscripts \
     modutils-initscripts

and take the configure informations and the steps into a document file?

Because we will begin yocto pam works next week, I hope I can finish the job in this week.

Thanks for your great help!


Regards,
Kai

>
>
>
>
>>> First see if you can compile the above with a minimal eglibc configuration.  If
>>> not I can help you work through those issues..  If you can, you SHOULD see a
>>> fairly dramatic decrease in size.
>>>
>>> --Mark
>>>
>>>> Thanks a lot!
>>>>
>>>> I made a mistake that try eglibc configurability in a directory which
>>>> has build core-image-minimal, so the packages which depend on eglibc
>>>> didn't rebuild, and I didn't find the dependency before. I am sorry!
>>>>
>>>> Regards,
>>>> Kai


--------------020001090403000305020002
Content-Type: text/x-patch; name="busybox-defconfig.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="busybox-defconfig.patch"

diff --git a/meta/recipes-core/busybox/busybox-1.18.4/defconfig b/meta/recipes-core/busybox/busybox-1.18.4/defconfig
index 5327a64..46090fc 100644
--- a/meta/recipes-core/busybox/busybox-1.18.4/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.18.4/defconfig
@@ -37,7 +37,7 @@ CONFIG_FEATURE_SUID_CONFIG_QUIET=y
 # CONFIG_FEATURE_PREFER_APPLETS is not set
 CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
 CONFIG_FEATURE_SYSLOG=y
-CONFIG_FEATURE_HAVE_RPC=y
+# CONFIG_FEATURE_HAVE_RPC is not set
 
 #
 # Build Options
@@ -178,7 +178,7 @@ CONFIG_ENV=y
 CONFIG_FEATURE_ENV_LONG_OPTIONS=y
 # CONFIG_EXPAND is not set
 # CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
-CONFIG_EXPR=y
+# CONFIG_EXPR is not set
 # CONFIG_EXPR_MATH_SUPPORT_64 is not set
 CONFIG_FALSE=y
 # CONFIG_FOLD is not set
@@ -191,7 +191,7 @@ CONFIG_ID=y
 # CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
 # CONFIG_LENGTH is not set
 CONFIG_LN=y
-CONFIG_LOGNAME=y
+# CONFIG_LOGNAME is not set
 CONFIG_LS=y
 CONFIG_FEATURE_LS_FILETYPES=y
 CONFIG_FEATURE_LS_FOLLOWLINKS=y
@@ -258,7 +258,7 @@ CONFIG_USLEEP=y
 # CONFIG_UUENCODE is not set
 CONFIG_WC=y
 # CONFIG_FEATURE_WC_LARGE is not set
-CONFIG_WHO=y
+# CONFIG_WHO is not set
 CONFIG_WHOAMI=y
 CONFIG_YES=y
 
@@ -321,7 +321,7 @@ CONFIG_WHICH=y
 #
 # Editors
 #
-CONFIG_AWK=y
+# CONFIG_AWK is not set
 # CONFIG_FEATURE_AWK_LIBM is not set
 CONFIG_CMP=y
 CONFIG_DIFF=y
@@ -329,7 +329,7 @@ CONFIG_DIFF=y
 CONFIG_FEATURE_DIFF_DIR=y
 # CONFIG_ED is not set
 CONFIG_PATCH=y
-CONFIG_SED=y
+# CONFIG_SED is not set
 CONFIG_VI=y
 CONFIG_FEATURE_VI_MAX_LEN=1024
 CONFIG_FEATURE_VI_8BIT=y
@@ -368,13 +368,13 @@ CONFIG_FEATURE_FIND_SIZE=y
 CONFIG_FEATURE_FIND_PRUNE=y
 # CONFIG_FEATURE_FIND_DELETE is not set
 CONFIG_FEATURE_FIND_PATH=y
-CONFIG_FEATURE_FIND_REGEX=y
+# CONFIG_FEATURE_FIND_REGEX is not set
 # CONFIG_FEATURE_FIND_CONTEXT is not set
 # CONFIG_FEATURE_FIND_LINKS is not set
-CONFIG_GREP=y
-CONFIG_FEATURE_GREP_EGREP_ALIAS=y
-CONFIG_FEATURE_GREP_FGREP_ALIAS=y
-CONFIG_FEATURE_GREP_CONTEXT=y
+# CONFIG_GREP is not set
+# CONFIG_FEATURE_GREP_EGREP_ALIAS is not set
+# CONFIG_FEATURE_GREP_FGREP_ALIAS is not set
+# CONFIG_FEATURE_GREP_CONTEXT is not set
 CONFIG_XARGS=y
 # CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
 # CONFIG_FEATURE_XARGS_SUPPORT_QUOTES is not set
@@ -384,15 +384,16 @@ CONFIG_XARGS=y
 #
 # Init Utilities
 #
-# CONFIG_INIT is not set
-# CONFIG_FEATURE_USE_INITTAB is not set
+CONFIG_INIT=y
+CONFIG_FEATURE_USE_INITTAB=y
 # CONFIG_FEATURE_KILL_REMOVED is not set
 CONFIG_FEATURE_KILL_DELAY=0
-# CONFIG_FEATURE_INIT_SCTTY is not set
-# CONFIG_FEATURE_INIT_SYSLOG is not set
-# CONFIG_FEATURE_EXTRA_QUIET is not set
-# CONFIG_FEATURE_INIT_COREDUMPS is not set
-# CONFIG_FEATURE_INITRD is not set
+CONFIG_FEATURE_INIT_SCTTY=y
+CONFIG_FEATURE_INIT_SYSLOG=y
+CONFIG_FEATURE_EXTRA_QUIET=y
+CONFIG_FEATURE_INIT_COREDUMPS=y
+CONFIG_FEATURE_INITRD=y
+CONFIG_INIT_TERMINAL_TYPE="linux"
 CONFIG_HALT=y
 # CONFIG_FEATURE_CALL_TELINIT is not set
 CONFIG_TELINIT_PATH=""
@@ -418,7 +419,7 @@ CONFIG_FIRST_SYSTEM_ID=0
 CONFIG_LAST_SYSTEM_ID=0
 # CONFIG_DELUSER is not set
 # CONFIG_GETTY is not set
-CONFIG_FEATURE_UTMP=y
+# CONFIG_FEATURE_UTMP is not set
 # CONFIG_FEATURE_WTMP is not set
 # CONFIG_LOGIN is not set
 # CONFIG_PAM is not set
@@ -518,12 +519,12 @@ CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
 CONFIG_LOSETUP=y
 # CONFIG_LSPCI is not set
 # CONFIG_LSUSB is not set
-# CONFIG_MDEV is not set
+CONFIG_MDEV=y
 # CONFIG_FEATURE_MDEV_CONF is not set
 # CONFIG_FEATURE_MDEV_RENAME is not set
 # CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
 # CONFIG_FEATURE_MDEV_EXEC is not set
-# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
+CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=y
 CONFIG_MKSWAP=y
 # CONFIG_FEATURE_MKSWAP_UUID is not set
 CONFIG_MORE=y
@@ -551,12 +552,12 @@ CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
 # CONFIG_FEATURE_MOUNT_HELPERS is not set
 # CONFIG_FEATURE_MOUNT_LABEL is not set
-CONFIG_FEATURE_MOUNT_NFS=y
+# CONFIG_FEATURE_MOUNT_NFS is not set
 # CONFIG_FEATURE_MOUNT_CIFS is not set
 CONFIG_FEATURE_MOUNT_FLAGS=y
 CONFIG_FEATURE_MOUNT_FSTAB=y
 CONFIG_PIVOT_ROOT=y
-CONFIG_RDATE=y
+# CONFIG_RDATE is not set
 # CONFIG_RDEV is not set
 # CONFIG_READPROFILE is not set
 # CONFIG_RTCWAKE is not set
@@ -617,10 +618,10 @@ CONFIG_DC=y
 # CONFIG_LAST is not set
 # CONFIG_FEATURE_LAST_SMALL is not set
 # CONFIG_FEATURE_LAST_FANCY is not set
-CONFIG_LESS=y
-CONFIG_FEATURE_LESS_MAXLINES=9999999
-CONFIG_FEATURE_LESS_BRACKETS=y
-CONFIG_FEATURE_LESS_FLAGS=y
+# CONFIG_LESS is not set
+CONFIG_FEATURE_LESS_MAXLINES=0
+# CONFIG_FEATURE_LESS_BRACKETS is not set
+# CONFIG_FEATURE_LESS_FLAGS is not set
 # CONFIG_FEATURE_LESS_MARKS is not set
 # CONFIG_FEATURE_LESS_REGEXP is not set
 # CONFIG_FEATURE_LESS_WINCH is not set
@@ -658,9 +659,9 @@ CONFIG_TIME=y
 #
 # Networking Utilities
 #
-CONFIG_FEATURE_IPV6=y
+# CONFIG_FEATURE_IPV6 is not set
 # CONFIG_FEATURE_UNIX_LOCAL is not set
-CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
+# CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
 # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
 # CONFIG_ARP is not set
 # CONFIG_ARPING is not set
@@ -676,7 +677,7 @@ CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
 # CONFIG_FTPGET is not set
 # CONFIG_FTPPUT is not set
 # CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
-CONFIG_HOSTNAME=y
+# CONFIG_HOSTNAME is not set
 # CONFIG_HTTPD is not set
 # CONFIG_FEATURE_HTTPD_RANGES is not set
 # CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
@@ -689,22 +690,22 @@ CONFIG_HOSTNAME=y
 # CONFIG_FEATURE_HTTPD_ENCODE_URL_STR is not set
 # CONFIG_FEATURE_HTTPD_ERROR_PAGES is not set
 # CONFIG_FEATURE_HTTPD_PROXY is not set
-CONFIG_IFCONFIG=y
-CONFIG_FEATURE_IFCONFIG_STATUS=y
+# CONFIG_IFCONFIG is not set
+# CONFIG_FEATURE_IFCONFIG_STATUS is not set
 # CONFIG_FEATURE_IFCONFIG_SLIP is not set
 # CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
-CONFIG_FEATURE_IFCONFIG_HW=y
+# CONFIG_FEATURE_IFCONFIG_HW is not set
 # CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
 # CONFIG_IFENSLAVE is not set
 # CONFIG_IFPLUGD is not set
-CONFIG_IFUPDOWN=y
-CONFIG_IFUPDOWN_IFSTATE_PATH="/var/run/ifstate"
+# CONFIG_IFUPDOWN is not set
+CONFIG_IFUPDOWN_IFSTATE_PATH=""
 # CONFIG_FEATURE_IFUPDOWN_IP is not set
 # CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
-CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN=y
-CONFIG_FEATURE_IFUPDOWN_IPV4=y
-CONFIG_FEATURE_IFUPDOWN_IPV6=y
-CONFIG_FEATURE_IFUPDOWN_MAPPING=y
+# CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN is not set
+# CONFIG_FEATURE_IFUPDOWN_IPV4 is not set
+# CONFIG_FEATURE_IFUPDOWN_IPV6 is not set
+# CONFIG_FEATURE_IFUPDOWN_MAPPING is not set
 # CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
 # CONFIG_INETD is not set
 # CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
@@ -713,11 +714,11 @@ CONFIG_FEATURE_IFUPDOWN_MAPPING=y
 # CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
 # CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
 # CONFIG_FEATURE_INETD_RPC is not set
-CONFIG_IP=y
-CONFIG_FEATURE_IP_ADDRESS=y
-CONFIG_FEATURE_IP_LINK=y
-CONFIG_FEATURE_IP_ROUTE=y
-CONFIG_FEATURE_IP_TUNNEL=y
+# CONFIG_IP is not set
+# CONFIG_FEATURE_IP_ADDRESS is not set
+# CONFIG_FEATURE_IP_LINK is not set
+# CONFIG_FEATURE_IP_ROUTE is not set
+# CONFIG_FEATURE_IP_TUNNEL is not set
 # CONFIG_FEATURE_IP_RULE is not set
 # CONFIG_FEATURE_IP_SHORT_FORMS is not set
 # CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
@@ -731,57 +732,59 @@ CONFIG_FEATURE_IP_TUNNEL=y
 # CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
 # CONFIG_NAMEIF is not set
 # CONFIG_FEATURE_NAMEIF_EXTENDED is not set
-CONFIG_NC=y
+# CONFIG_NBDCLIENT is not set
+# CONFIG_NC is not set
 # CONFIG_NC_SERVER is not set
 # CONFIG_NC_EXTRA is not set
-CONFIG_NETSTAT=y
+# CONFIG_NETSTAT is not set
 # CONFIG_FEATURE_NETSTAT_WIDE is not set
 # CONFIG_FEATURE_NETSTAT_PRG is not set
-CONFIG_NSLOOKUP=y
+# CONFIG_NSLOOKUP is not set
 # CONFIG_NTPD is not set
 # CONFIG_FEATURE_NTPD_SERVER is not set
-CONFIG_PING=y
-CONFIG_PING6=y
-CONFIG_FEATURE_FANCY_PING=y
+# CONFIG_PING is not set
+# CONFIG_PING6 is not set
+# CONFIG_FEATURE_FANCY_PING is not set
 # CONFIG_PSCAN is not set
-CONFIG_ROUTE=y
+# CONFIG_ROUTE is not set
 # CONFIG_SLATTACH is not set
-CONFIG_TELNET=y
+# CONFIG_TELNET is not set
 # CONFIG_FEATURE_TELNET_TTYPE is not set
-CONFIG_FEATURE_TELNET_AUTOLOGIN=y
+# CONFIG_FEATURE_TELNET_AUTOLOGIN is not set
 # CONFIG_TELNETD is not set
 # CONFIG_FEATURE_TELNETD_STANDALONE is not set
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
-CONFIG_TFTP=y
+# CONFIG_TFTP is not set
 # CONFIG_TFTPD is not set
-CONFIG_FEATURE_TFTP_GET=y
-CONFIG_FEATURE_TFTP_PUT=y
+# CONFIG_FEATURE_TFTP_GET is not set
+# CONFIG_FEATURE_TFTP_PUT is not set
 # CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
 # CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTP_DEBUG is not set
-CONFIG_TRACEROUTE=y
+# CONFIG_TRACEROUTE is not set
 # CONFIG_TRACEROUTE6 is not set
 # CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
 # CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE is not set
 # CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
-CONFIG_UDHCPD=y
+# CONFIG_UDHCPD is not set
 # CONFIG_DHCPRELAY is not set
-CONFIG_DUMPLEASES=y
+# CONFIG_DUMPLEASES is not set
 # CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
-CONFIG_DHCPD_LEASES_FILE="/var/lib/misc/udhcpd.leases"
-CONFIG_UDHCPC=y
-CONFIG_FEATURE_UDHCPC_ARPING=y
+CONFIG_DHCPD_LEASES_FILE=""
+# CONFIG_UDHCPC is not set
+# CONFIG_FEATURE_UDHCPC_ARPING is not set
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
-CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
-CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
+CONFIG_UDHCPC_DEFAULT_SCRIPT=""
+CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=0
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=""
 # CONFIG_VCONFIG is not set
-CONFIG_WGET=y
-CONFIG_FEATURE_WGET_STATUSBAR=y
-CONFIG_FEATURE_WGET_AUTHENTICATION=y
-CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+# CONFIG_WGET is not set
+# CONFIG_FEATURE_WGET_STATUSBAR is not set
+# CONFIG_FEATURE_WGET_AUTHENTICATION is not set
+# CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
+# CONFIG_FEATURE_WGET_TIMEOUT is not set
 # CONFIG_ZCIP is not set
 # CONFIG_TCPSVD is not set
 # CONFIG_TUNCTL is not set
@@ -914,7 +917,7 @@ CONFIG_FEATURE_SH_EXTRA_QUIET=y
 #
 CONFIG_SYSLOGD=y
 CONFIG_FEATURE_ROTATE_LOGFILE=y
-CONFIG_FEATURE_REMOTE_LOG=y
+# CONFIG_FEATURE_REMOTE_LOG is not set
 # CONFIG_FEATURE_SYSLOGD_DUP is not set
 CONFIG_FEATURE_IPC_SYSLOG=y
 CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=16

--------------020001090403000305020002--
