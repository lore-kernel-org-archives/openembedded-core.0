Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TdiKs-0001ck-2g
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 15:09:59 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 08FC3D22DB; Wed, 28 Nov 2012 14:55:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4E162D22D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 14:55:35 +0100 (CET)
Message-ID: <50B617CA.3070309@linaro.org>
Date: Wed, 28 Nov 2012 14:55:22 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Why hostname is not in /etc/hosts?
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
X-List-Received-Date: Wed, 28 Nov 2012 14:10:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When I start Apache on my target I get this:

AH00557: httpd: apr_sockaddr_info_get() failed for genericarmv8
AH00558: httpd: Could not reliably determine the server's fully
qualified domain name, using 127.0.0.1. Set the 'ServerName' directive
globally to suppress this message

Solution is "echo '127.0.0.1 genericarmv8' >>/etc/hosts" but this is not
what I would like to have to do on each first boot.

I looked more and found that /etc/hostname is set in base-files
(package_arch:machine) while /etc/hosts is in netbase
(package_arch:$arch (while package_arch:all would be enough)).

One solution which comes to my mind is to add $MACHINE entry in netbase
and make it p_arch:$MACHINE.

Other is do that in postinst but this will generate more work as upgrade
paths should not be broken.

Any other ideas?


