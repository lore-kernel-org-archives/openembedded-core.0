Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TdQMe-00035E-Ny
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 19:58:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qARIiL1i010334
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 10:44:21 -0800 (PST)
Received: from msp-dhcp39.wrs.com (172.25.34.39) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 27 Nov 2012 10:44:21 -0800
Message-ID: <50B50A05.9020201@windriver.com>
Date: Tue, 27 Nov 2012 12:44:21 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20121127182306.GE3692@jama.jama.net>
In-Reply-To: <20121127182306.GE3692@jama.jama.net>
Subject: Re: locale data broken in gstreamer
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
X-List-Received-Date: Tue, 27 Nov 2012 18:58:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/12 12:23 PM, Martin Jansa wrote:
> In last rebuild from scratch I've noticed couple of weird locale data:

Paul E and I just observed this as well...  My build machine is an -old- FC13 
machine..  system we found it on was x86.

--Mark

> Collected errors:
>   * check_data_file_clashes: Package gst-plugins-base-locale-en-gb wants
>   * to install file /usr/share/locale/en_GB/LC_MESSAGES/.mo
>          But that file is already provided by package  * gstreamer-locale-en-gb
>   * check_data_file_clashes: Package gst-plugins-base-locale-cs wants to
>   * install file /usr/share/locale/cs/LC_MESSAGES/.mo
>          But that file is already provided by package  * gstreamer-locale-cs
>
> All gstreamer and gst-plugins-base locales package just .mo file.
>
> from log.do_install:
> make[1]: Entering directory `/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gstreamer/0.10.36-r1/gstreamer-0.10.36/po'
> installing af.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gstreamer/0.10.36-r1/image/usr/share/locale/af/LC_MESSAGES/.mo
> installing az.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gstreamer/0.10.36-r1/image/usr/share/locale/az/LC_MESSAGES/.mo
> installing be.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gstreamer/0.10.36-r1/image/usr/share/locale/be/LC_MESSAGES/.mo
>
> They are installed to $(DOMAIN).mo
> gstreamer-0.10.36/po/Makefile.in.in:$(INSTALL_DATA) $$realcat $(DESTDIR)$$dir/$(DOMAIN).mo; \
> gstreamer-0.10.36/po/Makefile.in.in:echo "installing $$realcat as $(DESTDIR)$$dir/$(DOMAIN).mo"; \
>
> and DOMAIN should be set to GETTEXT_PACKAGE (gstreamer-0.10)
> ./gstreamer-0.10.36/po/Makevars:DOMAIN = $(GETTEXT_PACKAGE)
> ./gstreamer-0.10.36/po/Makefile:DOMAIN = $(GETTEXT_PACKAGE)
>
> Anyone else seen this, any idea why it fails now? gst* recipes weren't changed lately IIRC,
> so maybe some change in gettext which can break more recipes?
>
> Cheers,
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



