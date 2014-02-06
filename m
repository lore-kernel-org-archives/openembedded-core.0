Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6946D14A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 08:18:03 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id e16so1169890lan.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2014 00:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ly1j+mi2MNNMn1Hn9MXYCSNgKaEXYJeUDb/6f4L284A=;
	b=V4wDPfabVFJI4eNi5byMJWWGpU8QzH6cjdkEmmmQQkV2lGPU2YBuUokP4YSwpwBFyJ
	33pXQeQq1jpTMH+4MotYfcWltdbQDVHHQqzWZ4TsjnL6uGwGkzIRMCvPcWzE0MCGRVqs
	Osdb0mHMlNU/qjSGnqLAwEqroqziPY+TCikIkfS/9JwX7eTNAUi/bfAbMY4RlNeWO9nK
	4CA7vY1N1KE+5xCEszeb8g0X2c2VYWjmOlhrae00pvrgrDA7ZLex2qXeN/VUcKwmHnPY
	69x+FcZMeXVWStRUL8vJgWCIYaBf0mS3TDZeNJH/py51YQP+eRO4GpL7iJ7u9Dcf2Qn7
	AjiA==
X-Gm-Message-State: ALoCoQlQT4yVuji+OkMhSXTOIirFqJy1OnJu67c9tj7nLn/+wWBKq0j1czwJ7Z6T/ylFqmjutcoi
MIME-Version: 1.0
X-Received: by 10.152.4.68 with SMTP id i4mr4582486lai.8.1391674684515; Thu,
	06 Feb 2014 00:18:04 -0800 (PST)
Received: by 10.112.91.227 with HTTP; Thu, 6 Feb 2014 00:18:04 -0800 (PST)
In-Reply-To: <CAMKF1sqUSgy4ps58BWWX4ygCaOV+QbDSN4A=f8vXTPTMY6K7qw@mail.gmail.com>
References: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
	<1390912914-31576-7-git-send-email-fathi.boudra@linaro.org>
	<CAMKF1sqUSgy4ps58BWWX4ygCaOV+QbDSN4A=f8vXTPTMY6K7qw@mail.gmail.com>
Date: Thu, 6 Feb 2014 10:18:04 +0200
Message-ID: <CAGNsrLCDFYfr1Sf88XXBvV+z0D7q1xMZfOcXsfMhFoDyx1iwyw@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 6/6] ltp: fix ffsb ftbfs on cross-compiled environment
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
X-List-Received-Date: Thu, 06 Feb 2014 08:18:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 29 January 2014 01:11, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jan 28, 2014 at 4:41 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>> Add ffsb-remove-hardcoded-configure.patch: get rid of the hardcoded configure call preventing cross-compilation
>> Add do_configure_prepend to explicitly force regeneration the configure file and pass configure options as appropriate.
>>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>  .../ltp/ltp/ffsb-remove-hardcoded-configure.patch         | 15 +++++++++++++++
>>  meta/recipes-extended/ltp/ltp_20140115.bb                 |  7 +++++++
>>  2 files changed, 22 insertions(+)
>>  create mode 100644 meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
>>
>> diff --git a/meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch b/meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
>> new file mode 100644
>> index 0000000..9f02711
>> --- /dev/null
>> +++ b/meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
>> @@ -0,0 +1,15 @@
>> +Get rid of the hardcoded configure call preventing cross-compilation
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> +
>> +--- a/utils/Makefile
>> ++++ b/utils/Makefile
>> +@@ -29,7 +29,6 @@ FILTER_OUT_DIRS              := $(FFSBDIR)
>> + FFSB                  := $(FFSBDIR)/ffsb
>> +
>> + $(FFSB): $(FFSBDIR)
>> +-      cd $^; ./configure
>> +       $(MAKE) -C $^ -f "$(abs_srcdir)/$^/Makefile" all
>> +       cp $(FFSBDIR)/ffsb ffsb
>> +
>> diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
>> index 4e20f24..2ab1d50 100644
>> --- a/meta/recipes-extended/ltp/ltp_20140115.bb
>> +++ b/meta/recipes-extended/ltp/ltp_20140115.bb
>> @@ -25,6 +25,7 @@ SRCREV = "c8b3e28097e7d3208df9daceaf92c25eae87ebf0"
>>  SRC_URI = "git://github.com/linux-test-project/ltp.git \
>>      file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
>>      file://regen-makefile.patch \
>> +    file://ffsb-remove-hardcoded-configure.patch \
>>  "
>>
>>  S = "${WORKDIR}/git"
>> @@ -36,6 +37,12 @@ TARGET_CC_ARCH += "${LDFLAGS}"
>>  export prefix = "/opt/ltp"
>>  export exec_prefix = "/opt/ltp"
>>
>> +# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure call.
>> +# we explicitly force regeneration of that directory and pass configure options.
>> +do_configure_prepend() {
>> +    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS})
>
> you should pass ${CONFIGUREOPTS} to autoreconf as well

ok

>> +}
>> +
>>  do_install(){
>>      install -d ${D}/opt/ltp/
>>      oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
>> --
>> 1.8.1.2
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Fathi Boudra
Builds and Baselines Manager | Release Manager
Linaro.org | Open source software for ARM SoCs

