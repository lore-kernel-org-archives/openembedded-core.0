Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 29AED7869B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 02:45:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Dec 2017 18:45:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,391,1508828400"; 
   d="scan'208";a="1424733"
Received: from madhukar-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.65.170])
	by fmsmga007.fm.intel.com with ESMTP; 10 Dec 2017 18:45:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Dec 2017 15:44:20 +1300
Message-Id: <d682907cd92e10d0da483d1b918b0bb786359d0c.1512960174.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512960174.git.paul.eggleton@linux.intel.com>
References: <cover.1512960174.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] swig: add patch to support Node.js 7+
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
X-List-Received-Date: Mon, 11 Dec 2017 02:45:06 -0000

Add a patch which has been submitted upstream to support producing
bindings for Node.js 7+. This is important to enable mraa to build with
newer Node.js versions.

Fixes [YOCTO #12293].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../0001-Add-Node-7.x-aka-V8-5.2-support.patch     | 330 +++++++++++++++++++++
 meta/recipes-devtools/swig/swig_3.0.12.bb          |   1 +
 2 files changed, 331 insertions(+)
 create mode 100644 meta/recipes-devtools/swig/swig/0001-Add-Node-7.x-aka-V8-5.2-support.patch

diff --git a/meta/recipes-devtools/swig/swig/0001-Add-Node-7.x-aka-V8-5.2-support.patch b/meta/recipes-devtools/swig/swig/0001-Add-Node-7.x-aka-V8-5.2-support.patch
new file mode 100644
index 0000000..885c395
--- /dev/null
+++ b/meta/recipes-devtools/swig/swig/0001-Add-Node-7.x-aka-V8-5.2-support.patch
@@ -0,0 +1,330 @@
+From 1a5aadcd66e85c63d228bfd811a521d617c22a38 Mon Sep 17 00:00:00 2001
+From: Patrick Schneider <patrick.schneider@meetnow.eu>
+Date: Thu, 13 Apr 2017 15:02:53 +0200
+Subject: [PATCH] Add Node 7.x aka V8 5.2+ support
+
+* Use WeakCallbackInfo instead of WeakCallbackData
+* Use GetPrivate instead of GetHiddenValue
+* Adopted new signature for SetWeak to support destructor calling
+* SetAccessor deprecation fixed
+* Proper version checks where applicable
+
+Upstream-Status: Submitted [https://github.com/swig/swig/pull/968]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ Lib/javascript/v8/javascriptcode.swg    | 27 +++++++++++++++++-----
+ Lib/javascript/v8/javascripthelpers.swg | 29 +++++++++++++++++++++---
+ Lib/javascript/v8/javascriptinit.swg    | 16 +++++++++++--
+ Lib/javascript/v8/javascriptrun.swg     | 40 ++++++++++++++++++++++++++++-----
+ 4 files changed, 95 insertions(+), 17 deletions(-)
+
+diff --git a/Lib/javascript/v8/javascriptcode.swg b/Lib/javascript/v8/javascriptcode.swg
+index fb7d55c..b8c5089 100644
+--- a/Lib/javascript/v8/javascriptcode.swg
++++ b/Lib/javascript/v8/javascriptcode.swg
+@@ -133,10 +133,13 @@ static void $jswrapper(v8::Isolate *isolate, v8::Persistent<v8::Value> object, v
+   SWIGV8_Proxy *proxy = static_cast<SWIGV8_Proxy *>(parameter);
+ #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
+ static void $jswrapper(v8::Isolate *isolate, v8::Persistent<v8::Object> *object, SWIGV8_Proxy *proxy) {
+-#else
++#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+ static void $jswrapper(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &data) {
+   v8::Local<v8::Object> object = data.GetValue();
+   SWIGV8_Proxy *proxy = data.GetParameter();
++#else
++  static void $jswrapper(const v8::WeakCallbackInfo<SWIGV8_Proxy> &data) {
++  SWIGV8_Proxy *proxy = data.GetParameter();
+ #endif
+ 
+   if(proxy->swigCMemOwn && proxy->swigCObject) {
+@@ -147,7 +150,9 @@ static void $jswrapper(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &dat
+   }
+   delete proxy;
+ 
++#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+   object.Clear();
++#endif
+   
+ #if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031710)
+   object.Dispose();
+@@ -155,7 +160,7 @@ static void $jswrapper(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &dat
+   object.Dispose(isolate);
+ #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x032100)
+   object->Dispose(isolate);
+-#else
++#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+   object->Dispose();
+ #endif
+ }
+@@ -177,10 +182,13 @@ static void $jswrapper(v8::Isolate *isolate, v8::Persistent<v8::Value> object, v
+   SWIGV8_Proxy *proxy = static_cast<SWIGV8_Proxy *>(parameter);
+ #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
+ static void $jswrapper(v8::Isolate *isolate, v8::Persistent< v8::Object> *object, SWIGV8_Proxy *proxy) {
+-#else
++#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+ static void $jswrapper(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &data) {
+   v8::Local<v8::Object> object = data.GetValue();
+   SWIGV8_Proxy *proxy = data.GetParameter();
++#else
++static void $jswrapper(const v8::WeakCallbackInfo<SWIGV8_Proxy> &data) {
++  SWIGV8_Proxy *proxy = data.GetParameter();
+ #endif
+ 
+   if(proxy->swigCMemOwn && proxy->swigCObject) {
+@@ -197,7 +205,7 @@ static void $jswrapper(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &dat
+   object->Dispose(isolate);
+ #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
+   object->Dispose();
+-#else
++#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+   object.Clear();
+ #endif
+ }
+@@ -211,7 +219,11 @@ static void $jswrapper(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &dat
+  * ----------------------------------------------------------------------------- */
+ %fragment("js_getter", "templates")
+ %{
++#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+ static SwigV8ReturnValue $jswrapper(v8::Local<v8::String> property, const SwigV8PropertyCallbackInfo &info) {
++#else
++static SwigV8ReturnValue $jswrapper(v8::Local<v8::Name> property, const SwigV8PropertyCallbackInfo &info) {
++#endif
+   SWIGV8_HANDLESCOPE();
+   
+   v8::Handle<v8::Value> jsresult;
+@@ -233,8 +245,11 @@ fail:
+  * ----------------------------------------------------------------------------- */
+ %fragment("js_setter", "templates")
+ %{
+-static void $jswrapper(v8::Local<v8::String> property, v8::Local<v8::Value> value,
+-  const SwigV8PropertyCallbackInfoVoid &info) {
++#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
++static void $jswrapper(v8::Local<v8::String> property, v8::Local<v8::Value> value, const SwigV8PropertyCallbackInfoVoid &info) {
++#else
++static void $jswrapper(v8::Local<v8::Name> property, v8::Local<v8::Value> value, const SwigV8PropertyCallbackInfoVoid &info) {
++#endif
+   SWIGV8_HANDLESCOPE();
+   
+   $jslocals
+diff --git a/Lib/javascript/v8/javascripthelpers.swg b/Lib/javascript/v8/javascripthelpers.swg
+index 091467d..7461079 100644
+--- a/Lib/javascript/v8/javascripthelpers.swg
++++ b/Lib/javascript/v8/javascripthelpers.swg
+@@ -6,11 +6,16 @@ typedef v8::InvocationCallback  SwigV8FunctionCallback;
+ typedef v8::AccessorGetter      SwigV8AccessorGetterCallback;
+ typedef v8::AccessorSetter      SwigV8AccessorSetterCallback;
+ typedef v8::AccessorInfo        SwigV8PropertyCallbackInfoVoid;
+-#else
++#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+ typedef v8::FunctionCallback            SwigV8FunctionCallback;
+ typedef v8::AccessorGetterCallback      SwigV8AccessorGetterCallback;
+ typedef v8::AccessorSetterCallback      SwigV8AccessorSetterCallback;
+ typedef v8::PropertyCallbackInfo<void>  SwigV8PropertyCallbackInfoVoid;
++#else
++typedef v8::FunctionCallback            SwigV8FunctionCallback;
++typedef v8::AccessorNameGetterCallback  SwigV8AccessorGetterCallback;
++typedef v8::AccessorNameSetterCallback  SwigV8AccessorSetterCallback;
++typedef v8::PropertyCallbackInfo<void>  SwigV8PropertyCallbackInfoVoid;
+ #endif
+ 
+ /**
+@@ -65,18 +70,36 @@ SWIGRUNTIME void SWIGV8_AddStaticFunction(v8::Handle<v8::Object> obj, const char
+  */
+ SWIGRUNTIME void SWIGV8_AddStaticVariable(v8::Handle<v8::Object> obj, const char* symbol,
+   SwigV8AccessorGetterCallback getter, SwigV8AccessorSetterCallback setter) {
++#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+   obj->SetAccessor(SWIGV8_SYMBOL_NEW(symbol), getter, setter);
++#else
++  obj->SetAccessor(SWIGV8_CURRENT_CONTEXT(), SWIGV8_SYMBOL_NEW(symbol), getter, setter);
++#endif
+ }
+ 
+-SWIGRUNTIME void JS_veto_set_variable(v8::Local<v8::String> property, v8::Local<v8::Value> value,
+-  const SwigV8PropertyCallbackInfoVoid& info)
++#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
++SWIGRUNTIME void JS_veto_set_variable(v8::Local<v8::String> property, v8::Local<v8::Value> value, const SwigV8PropertyCallbackInfoVoid& info)
++#else
++SWIGRUNTIME void JS_veto_set_variable(v8::Local<v8::Name> property, v8::Local<v8::Value> value, const SwigV8PropertyCallbackInfoVoid& info)
++#endif
+ {
+     char buffer[256];
+     char msg[512];
+     int res;
+ 
++#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+     property->WriteUtf8(buffer, 256);
+     res = sprintf(msg, "Tried to write read-only variable: %s.", buffer);
++#else
++    v8::Local<v8::String> sproperty;
++    if (property->ToString(SWIGV8_CURRENT_CONTEXT()).ToLocal(&sproperty)) {
++      sproperty->WriteUtf8(buffer, 256);
++      res = sprintf(msg, "Tried to write read-only variable: %s.", buffer);
++    }
++    else {
++      res = -1;
++    }
++#endif
+ 
+     if(res<0) {
+       SWIG_exception(SWIG_ERROR, "Tried to write read-only variable.");
+diff --git a/Lib/javascript/v8/javascriptinit.swg b/Lib/javascript/v8/javascriptinit.swg
+index 34befa7..86008d9 100644
+--- a/Lib/javascript/v8/javascriptinit.swg
++++ b/Lib/javascript/v8/javascriptinit.swg
+@@ -7,15 +7,27 @@ SWIG_V8_SetModule(void *, swig_module_info *swig_module) {
+   v8::Local<v8::Object> global_obj = SWIGV8_CURRENT_CONTEXT()->Global();
+   v8::Local<v8::External> mod = SWIGV8_EXTERNAL_NEW(swig_module);
+   assert(!mod.IsEmpty());
++#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+   global_obj->SetHiddenValue(SWIGV8_STRING_NEW("swig_module_info_data"), mod);
++#else
++  v8::Local<v8::Private> privateKey = v8::Private::ForApi(v8::Isolate::GetCurrent(), SWIGV8_STRING_NEW("swig_module_info_data"));
++  global_obj->SetPrivate(SWIGV8_CURRENT_CONTEXT(), privateKey, mod);
++#endif
+ }
+ 
+ SWIGRUNTIME swig_module_info *
+ SWIG_V8_GetModule(void *) {
+   v8::Local<v8::Object> global_obj = SWIGV8_CURRENT_CONTEXT()->Global();
++#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+   v8::Local<v8::Value> moduleinfo = global_obj->GetHiddenValue(SWIGV8_STRING_NEW("swig_module_info_data"));
++#else
++  v8::Local<v8::Private> privateKey = v8::Private::ForApi(v8::Isolate::GetCurrent(), SWIGV8_STRING_NEW("swig_module_info_data"));
++  v8::Local<v8::Value> moduleinfo;
++  if (!global_obj->GetPrivate(SWIGV8_CURRENT_CONTEXT(), privateKey).ToLocal(&moduleinfo))
++    return 0;
++#endif
+ 
+-  if (moduleinfo.IsEmpty())
++  if (moduleinfo.IsEmpty() || moduleinfo->IsNull() || moduleinfo->IsUndefined())
+   {
+     // It's not yet loaded
+     return 0;
+@@ -23,7 +35,7 @@ SWIG_V8_GetModule(void *) {
+ 
+   v8::Local<v8::External> moduleinfo_extern = v8::Local<v8::External>::Cast(moduleinfo);
+ 
+-  if (moduleinfo_extern.IsEmpty())
++  if (moduleinfo_extern.IsEmpty() || moduleinfo_extern->IsNull() || moduleinfo_extern->IsUndefined())
+   {
+     // Something's not right
+     return 0;
+diff --git a/Lib/javascript/v8/javascriptrun.swg b/Lib/javascript/v8/javascriptrun.swg
+index 5ac52a5..30002c0 100644
+--- a/Lib/javascript/v8/javascriptrun.swg
++++ b/Lib/javascript/v8/javascriptrun.swg
+@@ -193,8 +193,10 @@ public:
+   void (*dtor) (v8::Isolate *isolate, v8::Persistent< v8::Value> object, void *parameter);
+ #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
+   void (*dtor) (v8::Isolate *isolate, v8::Persistent< v8::Object > *object, SWIGV8_Proxy *proxy);
+-#else
++#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+   void (*dtor) (const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &data);
++#else
++  void (*dtor) (const v8::WeakCallbackInfo<SWIGV8_Proxy> &data);
+ #endif
+ };
+ 
+@@ -241,9 +243,12 @@ SWIGRUNTIME void SWIGV8_Proxy_DefaultDtor(v8::Isolate *, v8::Persistent< v8::Val
+   SWIGV8_Proxy *proxy = static_cast<SWIGV8_Proxy *>(parameter);
+ #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
+ SWIGRUNTIME void SWIGV8_Proxy_DefaultDtor(v8::Isolate *, v8::Persistent< v8::Object > *object, SWIGV8_Proxy *proxy) {
+-#else
++#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+ SWIGRUNTIME void SWIGV8_Proxy_DefaultDtor(const v8::WeakCallbackData<v8::Object, SWIGV8_Proxy> &data) {
+   SWIGV8_Proxy *proxy = data.GetParameter();
++#else
++SWIGRUNTIME void SWIGV8_Proxy_DefaultDtor(const v8::WeakCallbackInfo<SWIGV8_Proxy> &data) {
++  SWIGV8_Proxy *proxy = data.GetParameter();
+ #endif
+ 
+   delete proxy;
+@@ -312,12 +317,18 @@ SWIGRUNTIME void SWIGV8_SetPrivateData(v8::Handle<v8::Object> obj, void *ptr, sw
+   } else {
+     cdata->handle.MakeWeak(cdata, SWIGV8_Proxy_DefaultDtor);
+   }
+-#else
++#elifif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+   if(cdata->swigCMemOwn && (SWIGV8_ClientData*)info->clientdata) {
+     cdata->handle.SetWeak(cdata, ((SWIGV8_ClientData*)info->clientdata)->dtor);
+   } else {
+     cdata->handle.SetWeak(cdata, SWIGV8_Proxy_DefaultDtor);
+   }
++#else
++  if(cdata->swigCMemOwn && (SWIGV8_ClientData*)info->clientdata) {
++    cdata->handle.SetWeak(cdata, ((SWIGV8_ClientData*)info->clientdata)->dtor, v8::WeakCallbackType::kParameter);
++  } else {
++    cdata->handle.SetWeak(cdata, SWIGV8_Proxy_DefaultDtor, v8::WeakCallbackType::kParameter);
++  }
+ #endif
+ 
+ #if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031710)
+@@ -470,7 +481,14 @@ int SwigV8Packed_Check(v8::Handle<v8::Value> valRef) {
+   
+   v8::Handle<v8::Object> objRef = valRef->ToObject();
+   if(objRef->InternalFieldCount() < 1) return false;
++#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+   v8::Handle<v8::Value> flag = objRef->GetHiddenValue(SWIGV8_STRING_NEW("__swig__packed_data__"));
++#else
++  v8::Local<v8::Private> privateKey = v8::Private::ForApi(v8::Isolate::GetCurrent(), SWIGV8_STRING_NEW("__swig__packed_data__"));
++  v8::Local<v8::Value> flag;
++  if (!objRef->GetPrivate(SWIGV8_CURRENT_CONTEXT(), privateKey).ToLocal(&flag))
++    return false;
++#endif
+   return (flag->IsBoolean() && flag->BooleanValue());
+ }
+ 
+@@ -519,10 +537,13 @@ SWIGRUNTIME void _wrap_SwigV8PackedData_delete(v8::Isolate *isolate, v8::Persist
+   SwigV8PackedData *cdata = static_cast<SwigV8PackedData *>(parameter);
+ #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
+ SWIGRUNTIME void _wrap_SwigV8PackedData_delete(v8::Isolate *isolate, v8::Persistent<v8::Object> *object, SwigV8PackedData *cdata) {
+-#else
++#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+ SWIGRUNTIME void _wrap_SwigV8PackedData_delete(const v8::WeakCallbackData<v8::Object, SwigV8PackedData> &data) {
+   v8::Local<v8::Object> object = data.GetValue();
+   SwigV8PackedData *cdata = data.GetParameter();
++#else
++SWIGRUNTIME void _wrap_SwigV8PackedData_delete(const v8::WeakCallbackInfo<SwigV8PackedData> &data) {
++  SwigV8PackedData *cdata = data.GetParameter();
+ #endif
+ 
+   delete cdata;
+@@ -537,7 +558,7 @@ SWIGRUNTIME void _wrap_SwigV8PackedData_delete(const v8::WeakCallbackData<v8::Ob
+   object->Dispose(isolate);
+ #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
+   object->Dispose();
+-#else
++#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+   object.Clear();
+ #endif
+ }
+@@ -550,7 +571,12 @@ v8::Handle<v8::Value> SWIGV8_NewPackedObj(void *data, size_t size, swig_type_inf
+ //  v8::Handle<v8::Object> obj = SWIGV8_OBJECT_NEW();
+   v8::Local<v8::Object> obj = SWIGV8_OBJECT_NEW();
+ 
++#if (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+   obj->SetHiddenValue(SWIGV8_STRING_NEW("__swig__packed_data__"), SWIGV8_BOOLEAN_NEW(true));
++#else
++  v8::Local<v8::Private> privateKey = v8::Private::ForApi(v8::Isolate::GetCurrent(), SWIGV8_STRING_NEW("__swig__packed_data__"));
++  obj->SetPrivate(SWIGV8_CURRENT_CONTEXT(), privateKey, SWIGV8_BOOLEAN_NEW(true));
++#endif
+ 
+ #if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031511)
+   obj->SetPointerInInternalField(0, cdata);
+@@ -573,9 +599,11 @@ v8::Handle<v8::Value> SWIGV8_NewPackedObj(void *data, size_t size, swig_type_inf
+   cdata->handle.MakeWeak(v8::Isolate::GetCurrent(), cdata, _wrap_SwigV8PackedData_delete);
+ #elif (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < SWIGV8_SETWEAK_VERSION)
+   cdata->handle.MakeWeak(cdata, _wrap_SwigV8PackedData_delete);
+-#else
++#elif (V8_MAJOR_VERSION-0) < 5 || (V8_MAJOR_VERSION == 5 && V8_MINOR_VERSION < 2)
+   cdata->handle.SetWeak(cdata, _wrap_SwigV8PackedData_delete);
+ //  v8::V8::SetWeak(&cdata->handle, cdata, _wrap_SwigV8PackedData_delete);
++#else
++  cdata->handle.SetWeak(cdata, _wrap_SwigV8PackedData_delete, v8::WeakCallbackType::kParameter);
+ #endif
+ 
+ #if (V8_MAJOR_VERSION-0) < 4 && (SWIG_V8_VERSION < 0x031710)
+-- 
+2.9.5
+
diff --git a/meta/recipes-devtools/swig/swig_3.0.12.bb b/meta/recipes-devtools/swig/swig_3.0.12.bb
index d5caa67..15f7348 100644
--- a/meta/recipes-devtools/swig/swig_3.0.12.bb
+++ b/meta/recipes-devtools/swig/swig_3.0.12.bb
@@ -2,6 +2,7 @@ require ${BPN}.inc
 
 SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
+            file://0001-Add-Node-7.x-aka-V8-5.2-support.patch \
            "
 SRC_URI[md5sum] = "82133dfa7bba75ff9ad98a7046be687c"
 SRC_URI[sha256sum] = "7cf9f447ae7ed1c51722efc45e7f14418d15d7a1e143ac9f09a668999f4fc94d"
-- 
2.9.5


