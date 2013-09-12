Return-Path: <stefan.seefeld@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 34EAB6BD23
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 18:22:22 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id to1so412370ieb.9
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 11:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=KUCjqiWbSZvNQsUt6kBnvA54A6nYcS3LDOqpt19atPs=;
	b=HGTsUtfrncBTzR9AUpJz9avMKdXJYW4AYdKfl+lA2GR0FYkawRRMk0HnHLwb+Prb19
	aQJqVT5l9XL1or4EPo6ue0v6FI+muJPUwhO+hfot0JVRO0NRelW0W1jCz+31q7yKLcFE
	Y0k0GE+dAL9y8KSZDBuBS429/Jdi2e/OYO/d5Dinll6p4mZu3uHA1LNbzF2vYscqKCTb
	Pouag2IsbOUdRwcVv7r2Riy5yuggbYkfLnyrbpkIvE5oioWcQh8+d4n42+89t+nAdHD2
	w21FvJbdQXQRUN4F8eE+BBevJ7Xq567dsMe2vaUxq5DkGw5UaFB8I4EZgsWnSK2T0rxn
	3K8Q==
X-Received: by 10.50.55.65 with SMTP id q1mr13764814igp.4.1379010143954;
	Thu, 12 Sep 2013 11:22:23 -0700 (PDT)
Received: from [192.168.2.19] (bas2-montreal29-1177924826.dsl.bell.ca.
	[70.53.180.218])
	by mx.google.com with ESMTPSA id i3sm1335081igh.0.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 11:22:23 -0700 (PDT)
Sender: Stefan Seefeld <stefan.seefeld@gmail.com>
Message-ID: <52320655.3080103@seefeld.name>
Date: Thu, 12 Sep 2013 14:22:13 -0400
From: Stefan Seefeld <stefan@seefeld.name>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Christian Babeux <christian.babeux@efficios.com>
References: <1378948190-16620-1-git-send-email-stefan_seefeld@mentor.com>
	<1378948190-16620-2-git-send-email-stefan_seefeld@mentor.com>
	<CAGDH53kUE8aB_MoRvsxhA7jhvTpvT0+DYCGNmZnVdMFLgreR7w@mail.gmail.com>
In-Reply-To: <CAGDH53kUE8aB_MoRvsxhA7jhvTpvT0+DYCGNmZnVdMFLgreR7w@mail.gmail.com>
Cc: lttng-dev@lists.lttng.org, Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Enable ptest support for lttng.
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
X-List-Received-Date: Thu, 12 Sep 2013 18:22:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2013-09-12 14:12, Christian Babeux wrote:
> Hi Stefan,
>
>> +
>> +make -C tests installcheck
>> +
> A majority of the tests will probably fail this way. As of now, most
> tests assumes that they are being runned in the build tree and expect
> binaries to be at specific paths. We will have to fix this upstream if
> you want to integrate our testsuite with ptest.

That's right, in my tests only the "unit_tests" suite ran without
issues. The "fast_regressions" suite had many more failures than when
run as part of the 'check' target. (See my mail to the lttng list for more.)

Still, I think it's good to include these tests. If anything they may
just provide more motivation to address the underlying issue. :-)
>> ++prove --merge -v --exec '' - < $1 | sed \
>> ++  -e 's|^ok \(.*\)|PASS: \1|' \
>> ++  -e 's|^not ok \(.*\)|FAIL: \1|' \
>> ++  | egrep -h 'PASS|FAIL'
> This is sadly needed because we are using TAP as our standardized test
> output format across the multiples lttng codebases.

Do you think it would be worthwhile submitting this patch upstream ?
(The output format of prove is not the easiest to understand, and even
with the above some information may be lost. A more robust fix would
probably include a dedicated TAP formatter plugin
(http://perldoc.perl.org/TAP/Formatter/Console.html) that produces
ptest-compatible output.

    Stefan

-- 

      ...ich hab' noch einen Koffer in Berlin...


