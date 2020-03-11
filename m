Return-Path: <sk@typedivision.de>
Received: from smtp03.udag.de (smtp03.udag.de [62.146.106.29])
	by mail.openembedded.org (Postfix) with ESMTP id 17F9660FEA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 21:27:10 +0000 (UTC)
Received: from MyMacBook.local (x4e3627bc.dyn.telefonica.de [78.54.39.188])
	by smtp03.udag.de (Postfix) with ESMTPA id 6E2F920B09;
	Wed, 11 Mar 2020 22:27:10 +0100 (CET)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200311163730.78078-1-sk@typedivision.de>
	<c487b390822a86c1f5dd9339324e86c973142e0e.camel@linuxfoundation.org>
	<d950b7b1-b5f1-8395-69d8-dde1d17725a8@typedivision.de>
	<CANNYZj-BW-y=Ky_WLdGaJR6-5g-Ok00a7dRDTdnxuN3M7Vt5FQ@mail.gmail.com>
From: Stefan Kral <sk@typedivision.de>
Message-ID: <3b553c8a-4c08-cb95-923c-7f03cb6d01aa@typedivision.de>
Date: Wed, 11 Mar 2020 22:27:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-BW-y=Ky_WLdGaJR6-5g-Ok00a7dRDTdnxuN3M7Vt5FQ@mail.gmail.com>
Authentication-Results: smtp03.udag.de;
	auth=pass smtp.auth=sk@typedivision.de smtp.mailfrom=sk@typedivision.de
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa: enable testresults.json for testexport
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
X-List-Received-Date: Wed, 11 Mar 2020 21:27:10 -0000
Content-Type: multipart/alternative;
	boundary="------------CB4FB8A2D7636390108264CF"
Content-Language: en-US

--------------CB4FB8A2D7636390108264CF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 11.03.20 um 21:46 schrieb Alexander Kanavin:
> On Wed, 11 Mar 2020 at 21:38, Stefan Kral <sk@typedivision.de 
> <mailto:sk@typedivision.de>> wrote:
>
>     I just started to evaluate the use of testexport.
>
>     If you think about removing that feature, what is the preferred
>     way to
>     test a deployed target image?
>     The idea here is to have two separate pipelines:
>
>     1. build
>     - a target-image-test (same as target-image but additional test
>     facilities enabled, like ptest)
>     - the testexport output
>
>     2. test
>     - fetch build results and install the target-image-test to the
>     real hardware
>     - run the exported runtime tests (host and target based cases)
>     - check/save the generated testresults.json
>
>
> You can do all of these in a single pipeline using testimage:
>
> 1. built target-image-test
> 2. flash target-image-test to real hardware
> 3. bitbake -c testimage target-image-test (set TEST_TARGET to 
> 'simpleremote', and ip/port for ssh access in local.conf)
>
> Is there a reason you need two pipelines?
>
> Alex

Doing build and test in one pipeline turns out to be more complicated 
due to:

- build machine may be different from test machine (with access to hardware)
- build the image is a one time job, tests may have to be repeated 
reproducibly
- executing long running tests slows down image creation (for development)
- tests on dedicated hardware should be runable asynchronously when hw 
is available

Running tests by bitbake -c testimage could be an option but to provide 
a full repo/bitbake/cache setup to run test cases sounds not as easy as 
having just python installed. And for that, testexport does its job 
quite well.

Btw. have you ever thought about to integrate/support some external test 
framework (like robot framework)?

Stefan


--------------CB4FB8A2D7636390108264CF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 11.03.20 um 21:46 schrieb Alexander
      Kanavin:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj-BW-y=Ky_WLdGaJR6-5g-Ok00a7dRDTdnxuN3M7Vt5FQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">On Wed, 11 Mar 2020 at 21:38, Stefan Kral &lt;<a
            href="mailto:sk@typedivision.de" moz-do-not-send="true">sk@typedivision.de</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">I just started to
            evaluate the use of testexport.<br>
            <br>
            If you think about removing that feature, what is the
            preferred way to <br>
            test a deployed target image?<br>
            The idea here is to have two separate pipelines:<br>
            <br>
            1. build<br>
            - a target-image-test (same as target-image but additional
            test <br>
            facilities enabled, like ptest)<br>
            - the testexport output<br>
            <br>
            2. test<br>
            - fetch build results and install the target-image-test to
            the real hardware<br>
            - run the exported runtime tests (host and target based
            cases)<br>
            - check/save the generated testresults.json<br>
          </blockquote>
          <div><br>
          </div>
          <div>You can do all of these in a single pipeline using
            testimage:</div>
          <div><br>
          </div>
          <div>1. built target-image-test</div>
          <div>2. flash target-image-test to real hardware</div>
          <div>3. bitbake -c testimage target-image-test (set
            TEST_TARGET to 'simpleremote', and ip/port for ssh access in
            local.conf)</div>
          <div><br>
          </div>
          <div>Is there a reason you need two pipelines?</div>
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Doing build and test in one pipeline turns out to be more
      complicated due to:</p>
    <p>- build machine may be different from test machine (with access
      to hardware)<br>
      - build the image is a one time job, tests may have to be repeated
      reproducibly<br>
      - executing long running tests slows down image creation (for
      development)<br>
      - tests on dedicated hardware should be runable asynchronously
      when hw is available</p>
    <p>Running tests by bitbake -c testimage could be an option but to
      provide a full repo/bitbake/cache setup to run test cases sounds
      not as easy as having just python installed. And for that,
      testexport does its job quite well.<br>
    </p>
    <p>Btw. have you ever thought about to integrate/support some
      external test framework (like robot framework)?<br>
    </p>
    <p>Stefan<br>
    </p>
  </body>
</html>

--------------CB4FB8A2D7636390108264CF--
