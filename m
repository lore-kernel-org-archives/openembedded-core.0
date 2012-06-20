Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1ShMuP-0001Vv-9U
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:33:29 +0200
Received: from [192.168.0.46] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 62E00600CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 15:14:09 +0100 (BST)
Message-ID: <4FE1EAFB.70001@communistcode.co.uk>
Date: Wed, 20 Jun 2012 16:23:39 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FE1E603.4040408@linaro.org>
	<4FE1E8D7.2010407@communistcode.co.uk> <4FE1E933.70500@linaro.org>
In-Reply-To: <4FE1E933.70500@linaro.org>
Subject: Re: Apache recipe?
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
X-List-Received-Date: Wed, 20 Jun 2012 15:33:29 -0000
X-Groupsio-MsgNum: 23892
Content-Type: multipart/mixed; boundary="------------070709090803000408020307"

--------------070709090803000408020307
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 20/06/12 16:16, Marcin Juszkiewicz wrote:
> >>Apache (based on 2.2.17 from OE classic).

I've just doubled checked the PHP one and it really is a mess, it would 
do more harm than good I believe but please find attached the recipe for 
the Hiawatha Webserver.

Please note that it has a slightly customised configuration file (php 
enabled) with it, and it is also a few minor versions out of date.

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


--------------070709090803000408020307
Content-Type: text/plain; charset=UTF-8;
 name="hiawatha_8.2.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="hiawatha_8.2.bb"

DESCRIPTION = "Lightweight secure web server"
HOMEPAGE = "http://www.hiawatha-webserver.org"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
DEPENDS = "openssl libxml2 libxslt"

SECTION = "custom"

PR = "r0"

SRC_URI = "http://hiawatha-webserver.org/files/hiawatha-8.2.tar.gz \
					 file://hiawatha-init \
           file://hiawatha.conf"

SRC_URI[md5sum] = "64b44499f40ddac9ebba88128e6d4aa9"

inherit cmake update-rc.d

INITSCRIPT_NAME = "hiawatha"
INITSCRIPT_PARAMS = "defaults 70"

EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
                  -DENABLE_CACHE=ON \
                  -DENABLE_DEBUG=ON \
                  -DENABLE_SSL=OFF \
                  -DENABLE_TOOLKIT=OFF \
                  -DENABLE_XSLT=OFF \
                  -DCMAKE_INSTALL_MANDIR=${mandir} \
                  -DCMAKE_INSTALL_BINDIR=${bindir} \
                  -DCMAKE_INSTALL_SBINDIR=${sbindir} \
                  -DCMAKE_INSTALL_SYSCONFDIR=${sysconfdir} \
                  -DCMAKE_INSTALL_LIBDIR=${libdir} \ 
                  -DLOG_DIR=/var/log/hiawatha \
                  -DPID_DIR=/var/run \
                  -DWEBROOT_DIR=/var/www/hiawatha \
                  -DWORK_DIR=/var/lib/hiawatha "

do_install_append() {

	# Copy over init script
  mkdir -p ${D}${sysconfdir}/init.d
  install -m 0755 ${WORKDIR}/hiawatha-init ${D}${sysconfdir}/init.d/hiawatha

  # Copy over custom configuration
  mkdir -p ${D}${sysconfdir}/hiawatha 
  install -m 0644 ${WORKDIR}/hiawatha.conf ${D}${sysconfdir}/hiawatha/hiawatha.conf

}

--------------070709090803000408020307
Content-Type: text/plain; charset=UTF-8;
 name="hiawatha.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="hiawatha.conf"

# Hiawatha main configuration file
#


# GENERAL SETTINGS
#
#ServerId = www-data
ConnectionsTotal = 150
ConnectionsPerIP = 10
SystemLogfile = /var/log/hiawatha/system.log
GarbageLogfile = /var/log/hiawatha/garbage.log

# SSL settings
#
#AllowedCiphers = RC4-SHA:RC4-MD5:DHE-RSA-AES256-SHA:DHE-DSS-AES256-SHA:AES256-SHA:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA:AES128-SHA

# BINDING SETTINGS
# A binding is where a client can connect to.
#
Binding {
	Port = 80
#	Interface = 127.0.0.1
#	MaxKeepAlive = 30
#	TimeForRequest = 3,20
}
#
#Binding {
#	Port = 443
#	Interface = ::1
#	MaxKeepAlive = 30
#	TimeForRequest = 3,20
#	SSLcertFile = hiawatha.pem
#}


# BANNING SETTINGS
# Deny service to clients who misbehave.
#
#BanOnGarbage = 300
#BanOnMaxPerIP = 60
#BanOnMaxReqSize = 300
#KickOnBan = yes
#RebanDuringBan = yes


# COMMON GATEWAY INTERFACE (CGI) SETTINGS
# These settings can be used to run CGI applications. Use the 'php-fcgi'
# tool to start PHP as a FastCGI daemon.
#
#CGIhandler = /usr/bin/perl:pl
CGIhandler = /usr/bin/php-cgi:php
#CGIhandler = /usr/bin/python:py
#CGIhandler = /usr/bin/ruby:rb
#CGIhandler = /usr/bin/ssi-cgi:shtml
#CGIextension = cgi
#
#FastCGIserver {
#	FastCGIid = PHP5
#	ConnectTo = 10.0.0.100:2005, 10.0.0.101:2005
#	Extension = php, php5
#	SessionTimeout = 30
#}


# URL TOOLKIT
# This URL toolkit rule was made for the Banshee PHP framework, which
# can be downloaded from http://www.hiawatha-webserver.org/banshee
#
#UrlToolkit {
#	ToolkitID = banshee
#	RequestURI isfile Return
#	Match ^/(css|files|images|js)/ Return
#	Match ^/(favicon.ico|robots.txt|sitemap.xml)$ Return
#	Match .*\?(.*) Rewrite /index.php?$1
#	Match .* Rewrite /index.php
#}


# DEFAULT WEBSITE
# It is wise to use your IP address as the hostname of the default website
# and give it a blank webpage. By doing so, automated webscanners won't find
# your possible vulnerable website.
#
Hostname = 127.0.0.1
WebsiteRoot = /var/www/hiawatha
StartFile = index.php
AccessLogfile = /var/log/hiawatha/access.log
ErrorLogfile = /var/log/hiawatha/error.log
ExecuteCGI = yes
#ErrorHandler = 404:/error.cgi


# VIRTUAL HOSTS
# Use a VirtualHost section to declare the websites you want to host.
#
#VirtualHost {
#	Hostname = www.my-domain.com
#	WebsiteRoot = /var/www/my-domain/public
#	StartFile = index.php
#	AccessLogfile = /var/www/my-domain/log/access.log
#	ErrorLogfile = /var/www/my-domain/log/error.log
#	TimeForCGI = 5
#	UseFastCGI = PHP5
#	UseToolkit = banshee
#}


# DIRECTORY SETTINGS
# You can specify some settings per directory.
#
#Directory {
#	Path = /home/baduser
#	ExecuteCGI = no
#	UploadSpeed = 10,2
#}

--------------070709090803000408020307
Content-Type: text/plain; charset=UTF-8;
 name="hiawatha-init"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="hiawatha-init"

#!/bin/sh

PATH=/sbin:/bin:/usr/sbin:/usr/bin
DAEMON=/usr/sbin/hiawatha
NAME=hiawatha
DESC="Hiawatha Web Server"
OPTS=""

case "$1" in
  start)
	echo -n "Starting $DESC: "
	start-stop-daemon --start -x "$DAEMON" -- $OPTS
	echo "$NAME."
	;;
  stop)
	echo -n "Stopping $DESC: "
	start-stop-daemon --stop -x "$DAEMON"
	echo "$NAME."
	;;
  restart|force-reload)
	echo -n "Restarting $DESC: "
	start-stop-daemon --stop -x "$DAEMON"
	sleep 1
	start-stop-daemon --start -x "$DAEMON" -- $OPTS
	echo "$NAME."
	;;
  *)
	N=/etc/init.d/$NAME
	echo "Usage: $N {start|stop|restart|force-reload}" >&2
	exit 1
	;;
esac

exit 0

--------------070709090803000408020307--
