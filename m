Received: from sea-mail.dfki.de ([134.96.191.185])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.zenzes@dfki.de>) id 1UA0ut-0007zT-6I
	for Openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 17:29:10 +0100
Received: from sea-mail.dfki.de (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id
	A067CF4595_12B8C22B for <Openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 16:06:58 +0000 (GMT)
Received: from mail.dfki.de (lnv-104.sb.dfki.de [134.96.191.146])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by sea-mail.dfki.de (Sophos Email Appliance) with ESMTPS id
	85B49F458E_12B8C22F for <Openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 16:06:58 +0000 (GMT)
Received: from [10.250.3.46] (unknown [10.250.3.46])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dfki.de (Postfix) with ESMTPSA id 64753310B4
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 17:06:58 +0100 (CET)
Message-ID: <512B8BED.5090809@dfki.de>
Date: Mon, 25 Feb 2013 17:06:05 +0100
From: Martin Zenzes <martin.zenzes@dfki.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Openembedded-core@lists.openembedded.org
Subject: Berkely-DB QA-Test: RPATH error in upon adding configure flag -- db_5.3.{15, 21}.bb
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
X-List-Received-Date: Mon, 25 Feb 2013 16:29:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm using the poky/yocto build-system, which are based on 
opembedded-core. Building one of their "vanilla" images works, adding 
the "Berkely DB" without changing it's default settings compiles too. 
But the default-configuration of the Berkely DB is not using the c++ 
interface so:

Upon adding the "--enable-cxx" configure option to the db-recipe I get 
the following "RPATH" error message during the "do_package" stage:

WARNING: QA Issue: db: Files/directories were installed but not shipped
   /usr/lib/libdb_cxx.so
ERROR: QA Issue: package db contains bad RPATH 
/opt/yocto/poky-danny-8.0/gumstix/tmp/sysroots/overo/usr/lib in file 
/opt/yocto/poky-danny-8.0/gumstix/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/db-5.3.15-r8/packages-split/db/usr/lib/libdb_cxx-5.3.so
ERROR: QA Issue: package db contains bad RPATH 
/opt/yocto/poky-danny-8.0/gumstix/tmp/sysroots/overo/usr/lib in file 
/opt/yocto/poky-danny-8.0/gumstix/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/db-5.3.15-r8/packages-split/db/usr/lib/libdb_cxx-5.so
ERROR: QA run found fatal errors. Please consider fixing them.

Happens on the "db_5.3.15.bb" and the "db_5.3.21.bb" recipe as well. 
Overwriting the "do_package_qa()" function in the recipe hides the error...

Any pointers on how to succeed?

Greetings
     Martin


