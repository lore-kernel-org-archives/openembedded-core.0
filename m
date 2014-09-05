Return-Path: <dvorkin@tibbo.com>
Received: from smtp.tibbo.com (smtp.tibbo.com [93.174.104.90])
	by mail.openembedded.org (Postfix) with ESMTP id A252F7137A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 08:36:05 +0000 (UTC)
Received: (qmail 26855 invoked by uid 508); 5 Sep 2014 12:15:01 +0400
Received: from 59-120-32-27.hinet-ip.hinet.net (HELO ?192.168.1.20?)
	(dvorkin@tibbo.com@59.120.32.27)
	by smtp.tibbo.com with SMTP; 5 Sep 2014 12:15:01 +0400
Message-ID: <540975F3.7050806@tibbo.com>
Date: Fri, 05 Sep 2014 16:36:03 +0800
From: Dvorkin Dmitry <dvorkin@tibbo.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: wrong automatic dependency
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
X-List-Received-Date: Fri, 05 Sep 2014 08:36:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello!

I wrote my own recipe for crda.
(http://wireless.kernel.org/en/developers/Regulatory/CRDA)

Dependencies is:
DEPENDS = "libgcrypt libnl"
RDEPENDS_${PN} = "udev wireless-regdb"

Crda Makefile is using python to rebuild it's database in 
build/installation step.
After installation I have several packages: crda itself, crda-dev, 
crda-doc, ... etc.
In my image I'm using only 'crda' package that doesn't need python.

But it seems Yocto detects python and add automatic dependency of python 
to my image anyway.

$ grep "crda" ./*.dot | grep pyt
./task-depends.dot:"crda.do_build" -> "python-dbus.do_package_write_ipk"
./task-depends.dot:"crda.do_build" -> "python.do_package_write_rpm"
./task-depends.dot:"crda.do_build" -> "python.do_package_write_deb"
./task-depends.dot:"crda.do_build" -> "python.do_package_write_ipk"
./task-depends.dot:"crda.do_build" -> 
"python-pygobject.do_package_write_rpm"
./task-depends.dot:"crda.do_build" -> 
"python-pygobject.do_package_write_deb"
./task-depends.dot:"crda.do_build" -> 
"python-pygobject.do_package_write_ipk"
./task-depends.dot:"crda.do_build" -> "python-dbus.do_package_write_rpm"
./task-depends.dot:"crda.do_build" -> "python-dbus.do_package_write_deb"

Is there any way to get rid of python dependency in this and only this 
recipe? it makes my image significally bigger.

