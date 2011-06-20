Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QYoOG-00073A-6q
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 02:00:24 +0200
Received: by iwn19 with SMTP id 19so4562612iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 16:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=L5wtHWjJIY5AcQ+VqZgeqCceOmMWP2nct7aU7jMYLqI=;
	b=puUz7n7PdOlqiu6XNtTwb7F15iiANIMSHqw7QvYMD7SfHPVmLehudXHeFU6T4dXTB2
	eoLul+LA/d7UILArx+3/pDdZLFulebFQ+6iU/MPr1nm3A6aBpXiQpGUvGZ2kvB2Jz/OL
	/U6SfIgaeW0iMXgJegvwQI9pi/7m1XvjZqjX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=dmiOBuqStD7TAiF4Uv0PKMwYeVQqH9HD2qomJKSiEp0HC6whRs8xB9MI/Kkk6b8oPa
	B/9KmJYMFvkIzR8CIKJNaEjPjfiwlon2Detyf8yR1vKeYFPyhJ3M0ZjCK35rvJgy29wN
	F0UPngCiPm4UcPWsecujr7U5ldGvW08PjuKDk=
Received: by 10.42.140.8 with SMTP id i8mr6739693icu.446.1308614210698;
	Mon, 20 Jun 2011 16:56:50 -0700 (PDT)
Received: from [172.23.0.111] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id gb8sm3474649ibb.60.2011.06.20.16.56.49
	(version=SSLv3 cipher=OTHER); Mon, 20 Jun 2011 16:56:50 -0700 (PDT)
Message-ID: <4DFFDE40.2040306@gmail.com>
Date: Mon, 20 Jun 2011 16:56:48 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308423290.git.paul.eggleton@linux.intel.com>
	<11485e23dab6a284009ac850616899faf1005f1a.1308423290.git.paul.eggleton@linux.intel.com>
In-Reply-To: <11485e23dab6a284009ac850616899faf1005f1a.1308423290.git.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/3] qt4-tools-nativesdk: fix unpack failure due to missing g++.conf
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
X-List-Received-Date: Tue, 21 Jun 2011 00:00:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/18/2011 11:56 AM, Paul Eggleton wrote:
> FILESPATHPKG was being used to in order to bring in linux.conf and
> g++.conf in this recipe, however this probably never worked since
> FILESPATHPKG always has the MACHINE appended to it and these are not
> machine-specific files.

FILESPATHPKG is not supported in oe-core. Its an oe.dev feature for now.


  The only reason it built was that these two files
> could be found within the "files" subdir until we removed Qt 4.6.3.
> Using FILESEXTRAPATHS (as qt4-tools-native does) solves this.
>
> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
> ---
>   meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |    5 +++--
>   1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
> index 5faf40c..d1f4b47 100644
> --- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
> +++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
> @@ -5,9 +5,10 @@ HOMEPAGE = "http://qt.nokia.com"
>   PRIORITY = "optional"
>   LICENSE = "LGPLv2.1 | GPLv3"
>
> -INC_PR = "r3"
> +INC_PR = "r4"
> +
> +FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
>
> -FILESPATHPKG =. "qt-${PV}:"
>   inherit nativesdk qmake2
>
>   SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \



