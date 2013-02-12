Received: from mail-ve0-f180.google.com ([209.85.128.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U5Pwp-0001Jj-0A
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 01:12:08 +0100
Received: by mail-ve0-f180.google.com with SMTP id jx10so635018veb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 15:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=SbMoE8BJAPmEzLh3Ujd4J/KDiEbghXul2dol9W9jr84=;
	b=03pRiRX7IGAomJJbBxSAodnfmWAQUNJ25QSGxw1JQX1Z0TSMOSXlM81qSprgdfKbTi
	N8v3tXoBVNJNfKgfQr1JWBJOHNGsEvZoaTOdEhfxc58q3eaVCsCijCTDcJoPeyKyM7Xe
	mvahR2d+PVwIQ/KqYW0j4kdOinOrLw6KKCrCefbmmsGjfHDGXL7S4aRNEP7TIUQieVMu
	oaSgBNmJjtiKUCwwTHcrhpPm0c8UCFA9iaCa81BgPwRPHdx3B4ZHqMTg1GpxzpBLy2rb
	ycDLDCbr0sV6BwGgdSaUjTsYlhjP7UvRDHNNhTI9G7S3JZvIAag1iKUlVBZqeFuOcjbN
	NFwg==
MIME-Version: 1.0
X-Received: by 10.220.219.73 with SMTP id ht9mr26652730vcb.47.1360713338722;
	Tue, 12 Feb 2013 15:55:38 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Tue, 12 Feb 2013 15:55:38 -0800 (PST)
In-Reply-To: <1360704254.30425.67.camel@ted>
References: <1360690970-9432-1-git-send-email-raj.khem@gmail.com>
	<1360704254.30425.67.camel@ted>
Date: Wed, 13 Feb 2013 00:55:38 +0100
Message-ID: <CALbNGRSiit5QwsYsrAbWhGQUzgCYYjScUdZPuoBxCDRDgOKbgQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd.bbclass: Introduce do_install_append and use systemd unitdir
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
X-List-Received-Date: Wed, 13 Feb 2013 00:12:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 12, 2013 at 10:24 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-02-12 at 09:42 -0800, Khem Raj wrote:
>> systemd always uses /lib and /usr/lib to store unit files
>> so using libdir and base_libdir is incorrect. It will work
>> where libdir is usr/lib and base_libdir is /lib but wont work
>> when say its /lib64
>>
>> Additionally introduce the install append from meta-oe
>> lot of recipe appends in meta-systemd depend on that
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/classes/systemd.bbclass |   21 +++++++++++++++------
>>  1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
>> index e0ea65c..32cc5c2 100644
>> --- a/meta/classes/systemd.bbclass
>> +++ b/meta/classes/systemd.bbclass
>> @@ -115,11 +115,9 @@ def systemd_populate_packages(d):
>>
>>      # Check service-files and call systemd_add_files_and_parse for each entry
>>      def systemd_check_services():
>> -        base_libdir = d.getVar('base_libdir', True)
>> -        searchpaths = [oe.path.join(d.getVar("sysconfdir", True), "systemd", "system"),]
>> -        searchpaths.append(oe.path.join(d.getVar("base_libdir", True), "systemd", "system"))
>> -        searchpaths.append(oe.path.join(d.getVar("libdir", True), "systemd", "system"))
>> -        searchpaths.append(oe.path.join(d.getVar("libdir", True), "systemd", "user"))
>> +        searchpaths = '/etc/systemd/system/' + ' '
>
> Why remove sysconfdir?
>
> Also, lets standardise on one variable please. We have
> ${nonarch_base_libdir} and ${systemd_unitdir} so do we need to
> hardcode /lib and /usr/lib?
>
> I'd suggest we add ${nonarch_libdir}, standardise on those and drop
> systemd_unitdir. We use the nonarch for other non-systemd multilib work.
>
>> +        searchpaths += '/lib/systemd/system/' + ' '
>> +        searchpaths += '/usr/lib/systemd/system/' + ' '
>>          systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
>>          has_exactly_one_service = len(systemd_packages.split()) == 1
>>          if has_exactly_one_service:
>> @@ -133,7 +131,7 @@ def systemd_populate_packages(d):
>>          for pkg_systemd in systemd_packages.split():
>>              for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
>>                  path_found = ''
>> -                for path in searchpaths:
>> +                for path in searchpaths.split():
>>                      if os.path.exists(oe.path.join(d.getVar("D", True), path, service)):
>>                          path_found = path
>>                          break
>> @@ -156,3 +154,14 @@ python populate_packages_prepend () {
>>      if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
>>          systemd_populate_packages (d)
>>  }
>> +# automatically install all *.service and *.socket supplied in recipe's SRC_URI
>> +do_install_append() {
>> +     for service in `find ${WORKDIR} -maxdepth 1 -name '*.service' -o -name '*.socket'` ; do
>> +     # ensure installing systemd-files only (e.g not avahi *.service)
>> +             if grep -q '\[Unit\]' $service ; then
>> +                     install -d ${D}${systemd_unitdir}/system
>> +                     install -m 644 $service ${D}${systemd_unitdir}/system
>> +             fi
>> +     done
>> +}
>> +
>
> Please no. We have this kind of mess from the binconfig class and its
> horrible to maintain. I'm looking forward to ripping that class out
> someday.
>
> Lets just write proper do_install functions in the recipes and make them
> conditional on systemd being enabled.
>
Copying similar code in in tons of recipes is easier to maintain? We
had this before meta-systemd started and it was a mess. How about a
variable SYSTEMD_AUTO_INSTALL?="enable" for this - since it fits in
many cases.

Andreas


